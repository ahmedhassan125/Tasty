import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.Controller,
    this.hint,
    this.prefix,
    required this.textInputType,
    this.isPassword = false,
    this.validator,
    this.suffix,
    this.function,
    this.height,
  });

  final TextEditingController Controller;
  final String? hint;
  final double? height;
  final Widget? prefix;
  final Widget? suffix;
  final bool isPassword;
  final TextInputType textInputType;
  final void Function()? function;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onTap: function,
        keyboardType: textInputType,
        obscureText: isPassword,
        controller: Controller,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),
          contentPadding: const EdgeInsets.all(20),
          suffixIcon: suffix,
          hintText: hint,
          hintStyle: Styles.regularTextStyle20WithColor,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefix,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
