import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kratos/core/common/app_button.dart';
import 'package:kratos/core/common/app_text_field.dart';
import 'package:kratos/core/common/loader_and_error_handler.dart';
import 'package:kratos/core/constants/image_constants.dart';
import 'package:kratos/core/extension/context_extension.dart';
import 'package:kratos/core/theme/app_colors.dart';
import 'package:kratos/features/auth/notifiers/auth_controller.dart';
import 'package:kratos/features/auth/screens/register_screen.dart';
import 'package:kratos/features/auth/widgets/remember_me_widget.dart';
import 'package:kratos/features/home/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return ref.watch(authControllerProvider) == true
        ? const LoadingScreen()
        : Scaffold(
            body: Column(
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.65,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: Image.asset(
                          ImageConstants.bg,
                          fit: BoxFit.contain,
                          width: width,
                          height: height,
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 65),
                          child: Image.asset(
                            ImageConstants.logo,
                            fit: BoxFit.contain,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 0,
                        left: 0,
                        child: AppTextField(
                          horizontalPadding: 22,
                          controller: _emailController,
                          hintText: "Email Address",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                AppTextField(
                    obscureText: true, controller: _passwordController, hintText: "Password", horizontalPadding: 22),
                const RememberMeWidget(),
                const SizedBox(height: 12),
                AppButton(onPressed: _login, text: "Login Now"),
                const SizedBox(height: 12),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      context.toNamed(RegisterScreen.routeName);
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        children: [
                          TextSpan(
                            text: 'Create one',
                            style: TextStyle(color: AppColors.secondary.withOpacity(0.7)),
                          ),
                        ],
                      ),
                      style: TextStyle(color: AppColors.greyColor.withOpacity(0.7), fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void _login() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      ref
          .read(authControllerProvider.notifier)
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
            ref: ref,
          )
          .then(
        (isSuccess) {
          if (isSuccess) {
            context.toNamedAndRemoveUntil(HomeScreen.routeName);
          }
        },
      );
    } else {
      Fluttertoast.showToast(msg: "Please fill in the required fields");
    }
  }
}
