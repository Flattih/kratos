import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kratos/core/common/app_button.dart';
import 'package:kratos/core/common/app_text_field.dart';
import 'package:kratos/core/common/loader_and_error_handler.dart';
import 'package:kratos/core/extension/context_extension.dart';
import 'package:kratos/core/theme/app_colors.dart';
import 'package:kratos/features/auth/notifiers/auth_controller.dart';
import 'package:kratos/features/home/home_screen.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(authControllerProvider) == true
        ? const LoadingScreen()
        : Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  Text(
                    "Create Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.bold, color: AppColors.secondary),
                  ),
                  const SizedBox(height: 22),
                  AppTextField(
                    controller: _nameController,
                    hintText: "Name",
                    horizontalPadding: 22,
                    verticalPadding: 6,
                  ),
                  AppTextField(
                      controller: _surnameController, hintText: "Surname", horizontalPadding: 22, verticalPadding: 6),
                  AppTextField(
                    controller: _emailController,
                    hintText: "Email Address",
                    horizontalPadding: 22,
                    verticalPadding: 6,
                  ),
                  AppTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    horizontalPadding: 22,
                    verticalPadding: 6,
                    obscureText: true,
                  ),
                  const Spacer(),
                  AppButton(onPressed: _register, text: "Create Account"),
                  const SizedBox(height: 18),
                  AppButton(
                    onPressed: () {
                      context.pop();
                    },
                    text: "Cancel",
                    bgColor: AppColors.red,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          );
  }

  void _register() {
    final String name = _nameController.text;
    final String surname = _surnameController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    if (name.isNotEmpty && surname.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      ref
          .read(authControllerProvider.notifier)
          .signUpWithEmailAndPassword(email: email, password: password, ref: ref)
          .then(
        (isSuccess) {
          if (isSuccess) {
            Fluttertoast.showToast(msg: "Registration successful");
            context.toNamedAndRemoveUntil(HomeScreen.routeName);
          } else {
            Fluttertoast.showToast(msg: "Registration failed");
          }
        },
      );
    } else {
      Fluttertoast.showToast(msg: "Please fill all fields");
    }
  }
}
