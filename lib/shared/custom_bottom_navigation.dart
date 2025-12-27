import 'package:flutter/material.dart';
import '../core/constants/styles.dart';
import '../generated/l10n.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.price,
    required this.bottom,
  });
  final String price;
  final Widget bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),

      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.all(Radius.circular()),
        ),
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).total,
                      style: Styles.regularTextStyle14.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(price, style: Styles.regularTextStyle20),
                    SizedBox(height: 10),
                  ],
                ),
                const Spacer(),
                bottom,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
