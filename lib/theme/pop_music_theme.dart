import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class MyAppTheme extends StatefulWidget {
  final Widget child;
  final ThemeMode? themeMode;

  const MyAppTheme({super.key, required this.child, this.themeMode});

  @override
  State<MyAppTheme> createState() => _MyAppThemeState();
}

class _MyAppThemeState extends State<MyAppTheme> {
  ThemeMode? themeMode;

  @override
  void initState() {
    super.initState();
    themeMode = widget.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeMode mode = themeMode ?? ThemeMode.system;
    final Brightness platformBrightness =
        MediaQuery.platformBrightnessOf(context);

    final bool useLightTheme = mode == ThemeMode.light ||
        (mode == ThemeMode.system && platformBrightness == ui.Brightness.light);

    if (useLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }

    return _InheritedTheme(
      isLight: useLightTheme,
      onThemeModeChanged: (newMode) {
        setState(() {
          themeMode = newMode;
        });
      },
      child: widget.child,
    );
  }
}

class _InheritedTheme extends InheritedWidget {
  final bool isLight;
  final Function(ThemeMode) onThemeModeChanged;

  const _InheritedTheme({
    Key? key,
    required this.isLight,
    required this.onThemeModeChanged,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant _InheritedTheme old) {
    return isLight != old.isLight;
  }
}

extension BuildContextTheme on BuildContext {
  bool get isLight =>
      dependOnInheritedWidgetOfExactType<_InheritedTheme>()!.isLight;

  void changeTheme(ThemeMode themeMode) {
    getInheritedWidgetOfExactType<_InheritedTheme>()!
        .onThemeModeChanged(themeMode);
  }
}
