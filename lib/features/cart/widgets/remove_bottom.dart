import 'package:flutter/material.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_cubit.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';

class RemoveBottom extends StatelessWidget {
  const RemoveBottom({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    var cartCubit = CartCubit.get(context);
    var cartItem = cartCubit.selectedCartItems[index];
    return InkWell(
      onTap: () {
        cartCubit.deleteFromCart(
          itemId: '${cartItem.itemId}',
          index: index
        );
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(S.of(context).remove, style: Styles.boldTextStyle18.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
