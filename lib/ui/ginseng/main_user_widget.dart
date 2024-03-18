import 'package:flutter/material.dart';
import 'package:getmoney/database/person.dart';
import 'package:getmoney/gen/assets.gen.dart';
import 'package:getmoney/ui/ginseng/inkwell_wrapper.dart';
import 'package:getmoney/utils/utils.dart';

import '../../theme/app_colors.dart';

class UserWidget extends StatelessWidget {
  final Person person;
  final ValueChanged<Person> callback;
  final ValueChanged<Person> onDelete;

  const UserWidget(
      {super.key,
      required this.person,
      required this.callback,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    var pointerColor = AppColors.sff219653;
    if (person.pointer < 0) {
      pointerColor = AppColors.sffeb5757;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              person.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: context.adaptiveColor(
                    light: AppColors.sff333333, dark: AppColors.sffffffff),
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w600,
                fontSize: 24,
                fontStyle: FontStyle.normal,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Text(
            person.pointer.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: pointerColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w900,
              fontSize: 24,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          InkWellWrapper(
            onTap: () async {
              final newPerson =
                  await context.showUpdateUserDialog(person: person);
              if (newPerson != null) {
                callback.call(newPerson);
              }
            },
            child: Assets.images.editIcon.svg(
              width: 48,
              height: 48,
              fit: BoxFit.none,
              colorFilter: context
                  .adaptiveColor(light: AppColors.sff333333, dark: Colors.white)
                  .toColorFilter(),
            ),
          ),
          InkWellWrapper(
            onTap: () async {
              final isDelete = await context.showConfirmDialog(
                  title: "Delete ${person.name} Player");
              if (isDelete == true) {
                onDelete.call(person);
              }
            },
            child: Assets.images.deleteIcon.svg(
              width: 48,
              height: 48,
              fit: BoxFit.none,
              colorFilter: AppColors.sffeb5757.toColorFilter(),
            ),
          ),
        ],
      ),
    );
  }
}
