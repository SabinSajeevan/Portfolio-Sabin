import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_sabin/constants/theme_data.dart';
import 'package:portfolio_sabin/helpers/helpers.dart';
import 'package:portfolio_sabin/modules/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: "Sabin Sajeevan",
        debugShowCheckedModeBanner: false,
        theme: ref.watch(appThemeProvider)
            ? ThemeClass.darkTheme
            : ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.system,
        builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
        home: const Home());
  }
}
