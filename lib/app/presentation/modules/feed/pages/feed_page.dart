// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_post/app/presentation/controllers/posts/post_controller.dart';
import 'package:pulse_post/app/presentation/controllers/user/user_controller.dart';
import 'package:pulse_post/app/utils/constants/images/image_constant.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';
import 'package:uikit/uikit.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final userController = Injector.get<UserController>();
  final postController = Injector.get<PostController>();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await userController.load();
    if (!userController.isTokenValid) {
      context.go('/login');
    } else {
      await postController.list();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => init(),
        child: LayoutBuilder(
          builder: (context, constraints) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(SizeToken.md),
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                child: Observer(
                  builder: (_) => SizedBox(
                    width: double.infinity,
                    child: ButtonSmallDark(
                      isLoading: userController.isLoading,
                      text: TextConstant.logout,
                      onPressed: () async {
                        await userController.logout();
                        if (!userController.isTokenValid) {
                          context.go('/login');
                        }
                      },
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  if (postController.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (postController.isServerError) {
                    return BannerError(
                      image: ImageConstant.serverError,
                      text: TextConstant.serverError,
                    );
                  }

                  final posts = postController.postList;

                  if (posts == null || posts.isEmpty) {
                    return BannerError(
                      image: ImageConstant.empty,
                      text: TextConstant.postEmpty,
                    );
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const DividerDefault(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: postController.postList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return TextBodyB2Dark(text: post.toString());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
