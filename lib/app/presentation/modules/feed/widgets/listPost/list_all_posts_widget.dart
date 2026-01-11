import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pulse_post/app/presentation/controllers/posts/post_controller.dart';
import 'package:pulse_post/app/utils/constants/images/image_constant.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';
import 'package:uikit/uikit.dart';

class ListAllPostsWidget extends StatelessWidget {
  ListAllPostsWidget({super.key});

  final postController = Injector.get<PostController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
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
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(vertical: SizeToken.sm),
            child: DividerDefault(),
          ),
          shrinkWrap: true,
          itemCount: postController.postList?.length ?? 0,
          itemBuilder: (context, index) {
            final post = posts[index];
            return TextBodyB2Dark(text: post.toString());
          },
        );
      },
    );
  }
}
