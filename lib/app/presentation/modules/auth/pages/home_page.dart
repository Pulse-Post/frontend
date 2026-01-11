// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_post/app/presentation/controllers/user/user_controller.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';
import 'package:uikit/uikit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final userController = Injector.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await userController.load();
          if (!userController.isTokenValid) {
            context.go('/login');
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(SizeToken.md),
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: SizeToken.lg,
                  children: [
                    Observer(
                      builder: (_) {
                        return Column(
                          children: [
                            TextLabelL2Dark(
                              text: "Nome: ${userController.user?.name}",
                            ),
                            TextLabelL2Dark(
                              text: "E-mail: ${userController.user?.email}",
                            ),
                            TextLabelL2Dark(
                              text: "Image: ${userController.user?.image}",
                            ),

                            SizedBox(
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
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
