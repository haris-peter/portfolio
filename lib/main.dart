import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/ui/splash_screen.dart';
import 'package:my_flutter_portfolio/utils/screen/screen_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: const Color(0xFF2c2f32),
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        builder: (context, child) => Overlay(
              initialEntries: [OverlayEntry(builder: (context) => ResponsiveFrameworkBuilder(child: child!))],
            ),
        home: SplashScreen());
  }
}
