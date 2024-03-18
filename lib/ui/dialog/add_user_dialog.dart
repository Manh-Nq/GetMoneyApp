import 'package:flutter/material.dart';
import 'package:getmoney/theme/app_colors.dart';
import 'package:getmoney/ui/custom/gradient_button.dart';
import 'package:getmoney/ui/dialog/bottom_sheet_wrapper.dart';
import 'package:getmoney/utils/utils.dart';

class AddUserDialog extends StatefulWidget {

  const AddUserDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      contentHeader: _buildHeader(context: context),
      contentBody: _buildBody(context: context),
      padding:
          EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
    );
  }

  Widget _buildHeader({required BuildContext context}) {
    return Text(
      "Add Player",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: context.adaptiveColor(
          light: AppColors.sff333333,
          dark: AppColors.sffffffff,
        ),
        overflow: TextOverflow.ellipsis,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      ),
    );
  }

  Widget _buildBody({required BuildContext context}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 28),
            child: _buildTextField(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: GradientButton(
                onPressed: () async {
                  final newName = textController.value.text;
                  if (newName.isNotEmpty) {
                    Navigator.pop(context, newName);
                  }
                },
                borderRadius: BorderRadius.circular(6),
                child: const Text(
                  "ADD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 56),
      decoration: BoxDecoration(
        color: context.adaptiveColor(
          light: AppColors.sffffffff,
          dark: AppColors.sff1f1f1f,
        ),
        border: Border.all(
          width: 1.0,
          color: AppColors.sff828282,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: TextField(
        autofocus: true,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: context.adaptiveColor(
            light: AppColors.sff000000,
            dark: AppColors.sffffffff,
          ),
        ),
        controller: textController,
        maxLines: 1,
        decoration: const InputDecoration(
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.sff828282,
          ),
          hintText: "Enter new name player",
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
