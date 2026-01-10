// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:go_router/go_router.dart';
import 'package:pulse_post/app/presentation/controllers/user/user_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userController = Injector.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await userController.load();
          if (userController.isTokenValid) {
            context.go('/home');
          }
        },
        child: LayoutBuilder(
          builder: (context, constraints) => ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: constraints.maxHeight),
                child: Center(child: Text('LOGIN')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
