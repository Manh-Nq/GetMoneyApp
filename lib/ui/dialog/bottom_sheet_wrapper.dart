import 'package:flutter/material.dart';
import 'package:getmoney/theme/app_colors.dart';
import 'package:getmoney/utils/utils.dart';

class BottomSheetWrapper extends StatelessWidget {
  final Widget contentHeader;
  final Widget contentBody;
  final EdgeInsetsGeometry padding;

  const BottomSheetWrapper({
    Key? key,
    required this.contentHeader,
    required this.contentBody,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context: context),
          Flexible(
            child: Container(
              padding:
                  EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
              color: context.adaptiveColor(
                light: AppColors.sffffffff,
                dark: AppColors.sff1f1f1f,
              ),
              child: contentBody,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader({required BuildContext context}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.adaptiveColor(
          light: AppColors.sffffffff,
          dark: AppColors.sff333333,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 22,
            ),
            child: _buildTopLine(),
          ),
          contentHeader,
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            height: 1,
            color: context.adaptiveColor(
              light: AppColors.sffe0e0e0,
              dark: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopLine() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.sff828282,
        borderRadius: BorderRadius.all(Radius.circular(7)),
      ),
      width: 80,
      height: 4,
    );
  }
}
