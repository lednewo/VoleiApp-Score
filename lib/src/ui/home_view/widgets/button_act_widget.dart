import 'package:flutter/material.dart';

class ButtonActWidget extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  const ButtonActWidget({
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Icon(
          icon,
          color: iconColor,
          size: 26,
        ),
      ),
    );
  }
}
