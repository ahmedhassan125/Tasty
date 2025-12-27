import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class AddRemoveBottom extends StatelessWidget {
  const AddRemoveBottom({super.key, required this.bottomIcon, required this.onPree});
  final IconData bottomIcon;
  final void Function() onPree;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPree,
      child: Container(
          height: 45,
          width: 42,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(80),
          ),
          child:Icon(bottomIcon,color: Colors.white,)

      ),

    );
  }
}
