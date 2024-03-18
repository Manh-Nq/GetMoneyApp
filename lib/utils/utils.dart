import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:getmoney/database/person.dart';
import 'package:getmoney/theme/pop_music_theme.dart';
import 'package:getmoney/ui/dialog/add_user_dialog.dart';
import 'package:getmoney/ui/dialog/confirm_dialog.dart';
import 'package:getmoney/ui/dialog/update_user_dialog.dart';

extension ColorExtension on Color {
  ColorFilter toColorFilter() {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}

extension BuildContextColor on BuildContext {
  Color adaptiveColor({required Color light, required Color dark}) =>
      isLight ? light : dark;

  Future<String?> showAddUserDialog() async {
    return await showBottomSheetDialog(
      isDismissible: true,
      isScrollControlled: true,
      child: const AddUserDialog(),
    );
  }

  Future<Person?> showUpdateUserDialog({required Person person}) async {
    return await showBottomSheetDialog(
      isDismissible: true,
      isScrollControlled: true,
      child: UpdateUserDialog(
        person: person,
      ),
    );
  }

  Future<dynamic> showBottomSheetDialog({
    required Widget child,
    bool isDismissible = true,
    bool isScrollControlled = false,
  }) async {
    return await showModalBottomSheet(
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      context: this,
      useRootNavigator: true,
      useSafeArea: true,
      constraints: const BoxConstraints(maxWidth: 560),
      backgroundColor: Colors.transparent,
      builder: (context) => child,
    );
  }

  Future<bool?> showConfirmDialog({String title = ""}) async {
    return await showDialog(
      context: this,
      builder: (context) {
        return ConfirmDialog(
          title: title,
        );
      },
    );
  }

}

bool isInteger(dynamic value) => value is int || value == value.roundToDouble();
