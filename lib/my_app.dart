import 'package:flutter/material.dart';
import 'package:getmoney/database/database_helper.dart';

import 'database/app_database.dart';

class AppData {
  final AppDatabase database;

  AppData({
    required this.database,
  });
}

class MoneyApp extends StatefulWidget {
  final Widget child;

  const MoneyApp({
    super.key,
    required this.child,
  });

  @override
  State<MoneyApp> createState() => _MoneyAppState();
}

class _MoneyAppState extends State<MoneyApp> {
  final Future<AppData> _future = Future(() async {
    final database = await DatabaseHelper().database;

    return AppData(
      database: database,
    );
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          return _InheritedData(
            data: data,
            child: widget.child,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _InheritedData extends InheritedWidget {
  final AppData data;

  const _InheritedData({
    required super.child,
    required this.data,
  });

  @override
  bool updateShouldNotify(covariant _InheritedData oldWidget) {
    return oldWidget.data != data;
  }
}
extension DatabaseContext on BuildContext {
  AppDatabase get database =>
      getInheritedWidgetOfExactType<_InheritedData>()!.data.database;
}