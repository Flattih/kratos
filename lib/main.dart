import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/app_startup.dart';
import 'package:kratos/core/theme/app_theme.dart';
import 'package:kratos/features/splash/splash_screen.dart';
import 'package:kratos/router.dart';

void main() => runApp(const ProviderScope(child: AppStartupWidget()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'Kratos',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: (settings) => generateRoute(settings),
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const SplashScreen());
  }
}
