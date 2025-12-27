import 'package:flutter/material.dart';

import '../custom_text_form_field.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({super.key, required this.widgetName, required this.controller});
  final String widgetName;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        Text(widgetName),
        const SizedBox(height: 5),
        CustomTextFormField(
          Controller: controller ,
          height: 60,
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );;
  }
}
