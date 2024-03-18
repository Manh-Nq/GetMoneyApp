import 'package:flutter/material.dart';
import 'package:getmoney/theme/app_colors.dart';
import 'package:getmoney/ui/ginseng/inkwell_wrapper.dart';
import 'package:getmoney/utils/utils.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;

  const ConfirmDialog({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Container(
          decoration: BoxDecoration(
            color: context.adaptiveColor(
              light: AppColors.sffffffff,
              dark: AppColors.sff1f1f1f,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  title,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.adaptiveColor(
                      light: AppColors.sff000000,
                      dark: AppColors.sffffffff,
                    ),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Spacer(),
                  _buildActionWidget(
                    context: context,
                    title: "Cancel",
                    textColor:  context.adaptiveColor(
                      light: AppColors.sff333333,
                      dark: AppColors.sffffffff,
                    ),
                    callback: () {
                      Navigator.pop(context, false);
                    },
                  ),
                  _buildActionWidget(
                    context: context,
                    title: "Delete",
                    textColor: AppColors.sffeb5757,
                    callback: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionWidget({
    required BuildContext context,
    required String title,
    required Color textColor,
    required VoidCallback callback,
  }) {
    return InkWellWrapper(
      borderRadius: BorderRadius.circular(4),
      onTap: () {
        callback();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
