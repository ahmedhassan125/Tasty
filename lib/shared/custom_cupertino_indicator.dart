import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors.dart';

class CustomCupertinoIndicator extends StatelessWidget {
  const CustomCupertinoIndicator({
    super.key,
    this.width,
    this.height,
    this.radius, this.color,
  });
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      width: width ?? double.infinity,
      height: height ?? 50,
      child: Center(
        child: CupertinoActivityIndicator(
          color: color ?? kPrimaryColor,
          radius: radius ?? 15,
          animating: true,
        ),
      ),
    );
  }
}
