import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_bottom.dart';
import '../../home/data/hom_cubit/home_cubit.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.text,
    required this.title,
    required this.icon,
     this.onTap,
  });
  final String title;
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;
    final height = MediaQuery.of(context).size.height * 0.5;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 45,
                child: Icon(icon, color: Colors.white, size: 60),
              ),
              const SizedBox(height: 30),
              Text(title, style: Styles.boldTextStyle20),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  text,
                  style: Styles.gryRegularTextStyle18,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              CustomBottom(
                bottomText: S.of(context).goBack,
                onTap: ()=> Navigator.pop(context),
                ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
