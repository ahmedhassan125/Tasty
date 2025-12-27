import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';
import '../../generated/l10n.dart';
import '../custom_bottom.dart';
class GuestScreenWidget extends StatelessWidget {
  const GuestScreenWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {

    return
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.15),
            SvgPicture.asset(
              'assets/images/logo3.svg', colorFilter: const ColorFilter.mode(
              kPrimaryColor,
              BlendMode.srcIn,
            ),),
            Text(
              textAlign: TextAlign.center,
              S.of(context).wellComeText,
              style: Styles.regularTextStyle16.copyWith(color: kPrimaryColor),
            ),
            const Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image(image: AssetImage('assets/images/GuestPhoto.jpg')),
                // ),
              ),
            ),
             Text(
                S.of(context).mustLogIn, style: Styles.boldTextStyle18),
            const SizedBox(height: 10),
            Text(text,
              style: Styles.gryRegularTextStyle18.copyWith(color: kPrimaryColor),
            ),
            const SizedBox(height: 20),
            CustomBottom(
              bottomText: S.of(context).login,
              onTap: () {
                context.push('/LogInScreen');
              },
            ),
        
        
          ],
        ),
      );
  }
}