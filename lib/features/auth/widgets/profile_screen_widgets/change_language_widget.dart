import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/localization/language_cubit.dart';
import '../../data/auth_cubit/auth_cubit.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({
    super.key,
    required this.selectedLanguage,
    required this.languageName,
    required this.function,
  });
  final bool selectedLanguage;
  final String languageName;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: selectedLanguage ? kPrimaryColor : Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        width: double.infinity,
        height: 40,
        child: InkWell(
          onTap: function,
          child: Center(
            child: Text(
              languageName,
              style: selectedLanguage
                  ? Styles.regularTextStyle20white
                  : Styles.regularTextStyle20,
            ),
          ),
        ),
      ),
    );
  }
}
