import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/constants/styles.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.bottomText,
    required this.onTap,
    this.width,
    this.icon, this.color, this.height, this.textColor,
  });
  final String bottomText;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Widget? icon;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Container(
        width: width ?? 180,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color ??kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bottomText,
                style: Styles.regularTextStyle16.copyWith(
                  color: textColor ?? Colors.white,
                  overflow: TextOverflow.ellipsis
                ),
              ),
              if (icon != null) const Spacer(),
              if (icon != null) icon!,
              // Icon(Icons.shopping_cart_outlined, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
