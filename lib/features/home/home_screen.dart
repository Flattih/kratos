import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/core/common/app_button.dart';
import 'package:kratos/core/extension/context_extension.dart';
import 'package:kratos/core/theme/app_colors.dart';
import 'package:kratos/features/auth/notifiers/auth_controller.dart';
import 'package:kratos/features/auth/screens/login_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              Center(
                child: Text(FirebaseAuth.instance.currentUser?.email ?? "User",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.primary)),
              ),
              const Spacer(
                flex: 4,
              ),
              AppButton(
                  onPressed: () {
                    ref.read(authControllerProvider.notifier).logout().then(
                      (isSuccess) {
                        if (isSuccess) {
                          context.toNamedAndRemoveUntil(LoginScreen.routeName);
                        }
                      },
                    );
                  },
                  text: "Logout"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
