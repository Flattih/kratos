import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/core/common/loader_and_error_handler.dart';
import 'package:kratos/core/constants/image_constants.dart';
import 'package:kratos/core/extension/context_extension.dart';
import 'package:kratos/core/theme/app_colors.dart';
import 'package:kratos/features/auth/notifiers/auth_controller.dart';
import 'package:kratos/features/auth/screens/login_screen.dart';
import 'package:kratos/features/home/home_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateChangeProvider).when(
          data: (user) {
            // After 5 seconds, navigate to the HomeScreen if the user is not null, otherwise navigate to the LoginScreen
            Future.delayed(const Duration(seconds: 5), () {
              user != null
                  ? context.toNamedAndRemoveUntil(HomeScreen.routeName)
                  : context.toNamedAndRemoveUntil(LoginScreen.routeName);
            });
            return Scaffold(
              backgroundColor: AppColors.darkBackground,
              body: Center(
                child: Image.asset(
                  ImageConstants.splash,
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
            errorMessage: error.toString(),
            onRetry: () {
              ref.invalidate(authStateChangeProvider);
            },
          ),
          loading: () => const LoadingScreen(),
        );
  }
}
