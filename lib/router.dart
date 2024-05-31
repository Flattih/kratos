import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kratos/features/auth/screens/login_screen.dart';
import 'package:kratos/features/auth/screens/register_screen.dart';
import 'package:kratos/features/home/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  return switch (routeSettings.name) {
    LoginScreen.routeName => FadePageRoute(builder: (context) => const LoginScreen()),
    HomeScreen.routeName => FadePageRoute(builder: (context) => const HomeScreen()),
    RegisterScreen.routeName => FadePageRoute(builder: (context) => const RegisterScreen()),
    _ => MaterialPageRoute(builder: (_) => const Scaffold()),
  };
}

// This class is used to create a custom route transition
class FadePageRoute<T> extends CupertinoPageRoute<T> {
  FadePageRoute({required super.builder});

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    final widget = super.buildTransitions(context, animation, secondaryAnimation, child);
    if (widget is CupertinoPageTransition) {
      return FadeTransition(
        opacity: animation,
        child: widget.child,
      );
    } else {
      return widget;
    }
  }
}
