import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class CustomProfileBottom extends StatelessWidget {
  const CustomProfileBottom({
    super.key,
    required this.bottomText,
    required this.onTap,
    this.bottomColor,
    this.width,
    this.textColor,
  });
  final String bottomText;
  final VoidCallback onTap;
  final Color? bottomColor;
  final Color? textColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(10),
        color: bottomColor ?? kPrimaryColor,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          bottomText,
          style: Styles.regularTextStyle18.copyWith(
            color: textColor ?? kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
