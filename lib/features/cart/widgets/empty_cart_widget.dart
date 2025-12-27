import 'package:flutter/material.dart';
import 'package:yumzy/features/home/data/hom_cubit/home_cubit.dart';
import 'package:yumzy/shared/app_string.dart';
import '../../../core/constants/styles.dart';
import '../../../core/network/shared_pref_helper.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_bottom.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.3),
        const Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image(image: AssetImage('assets/images/emptycart3.png')),
          ),
        ),
         Text(S.of(context).emptyCart, style: Styles.boldTextStyle18),
        const SizedBox(height: 20),
         Text(
          S.of(context).startShopping,
          style: Styles.gryRegularTextStyle18,
        ),
        const SizedBox(height: 20),
        CustomBottom(
          bottomText: S.of(context).goShopping,
          onTap: () {
            homeCubit.bottomNavChange(0);
          },
        ),

      ],
    );
  }
}
