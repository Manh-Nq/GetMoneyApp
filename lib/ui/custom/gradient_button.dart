import 'package:flutter/material.dart';
import 'package:getmoney/theme/app_colors.dart';
import 'package:getmoney/utils/utils.dart';

class GradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Gradient _gradient;
  final BorderRadiusGeometry borderRadius;
  final bool hasShadow;

  const GradientButton({
    super.key,
    required this.onPressed,
    this.borderRadius = BorderRadius.zero,
    this.hasShadow = false,
    Gradient? gradient,
    required this.child,
  }) : _gradient = gradient ??
            const LinearGradient(
              begin: Alignment(-1, 1),
              end: Alignment(1, -1),
              colors: [
                AppColors.sff0081BC,
                AppColors.sff0FCCDA,
              ],
            );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: _gradient,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: context
                      .adaptiveColor(
                        light: Colors.black,
                        dark: Colors.white,
                      )
                      .withOpacity(0.2),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                ),
              ]
            : null,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: child,
      ),
    );
  }
}
