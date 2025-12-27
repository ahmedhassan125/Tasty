import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_state.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_bottom.dart';
import '../../checkout/screen/check_out_screen.dart';

class CheckoutItemBuilder extends StatelessWidget {
  const CheckoutItemBuilder({super.key, });
  @override
  Widget build(BuildContext context) {
    var cartCubit = CartCubit.get(context);

    return
      BlocBuilder<CartCubit ,CartState>(builder: (context, state) {
        return
          Card(
          elevation: 10,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  Text(S.of(context).total, style: Styles.boldTextStyle18.copyWith(color: Colors.grey[600]),),
                  SizedBox(width: 20),
                  Text('${cartCubit.totalPrice}',
                   // '${cartCubit.finalPrice.toString()} EGP',
                    style: Styles.boldTextStyle18,
                  ),
                  const Spacer(),
                  CustomBottom(
                    width: 160,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CheckOutScreen()),
                      );
                    },
                    bottomText: S.of(context).checkout,
                  ),
                ],
              ),
            ),
          ),
        );
      },

      );
  }
}
