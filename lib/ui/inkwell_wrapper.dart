import 'package:flutter/material.dart';

class InkWellWrapper extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final VoidCallback onTap;

  const InkWellWrapper({
    Key? key,
    required this.child,
    this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
