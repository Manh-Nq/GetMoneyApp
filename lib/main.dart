import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getmoney/my_app.dart';
import 'package:getmoney/theme/app_colors.dart';
import 'package:getmoney/theme/pop_music_theme.dart';
import 'package:getmoney/ui/ginseng/main_screen.dart';

void main() {
  runApp(
    const MoneyApp(
      child: MyAppTheme(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: Colors.white,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.sff0081BC),
        useMaterial3: true,
      ),
      home: const GinSengScreen(),
    );
  }
}
