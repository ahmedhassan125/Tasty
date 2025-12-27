import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumzy/features/cart/widgets/remove_bottom.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../data/cart_cubit/cart_cubit.dart';
import '../data/cart_cubit/cart_state.dart';
import 'add_remove_bottom.dart';

class CartScreenBuilder extends StatelessWidget {
  const CartScreenBuilder({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final cartItem = cartCubit.selectedCartItems[index];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.52,
                      child: CachedNetworkImage(
                      //  fit: BoxFit.fill,
                        placeholder: (context, url) => CustomCupertinoIndicator(),
                        imageUrl: cartItem.image ?? '',
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                    const Spacer(),
                    customText('${cartItem.name}'),
                    const  SizedBox(height: 5),
                    customText(' ${cartItem.price} ${S.of(context).EGP}'),
                    const  SizedBox(height: 10),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AddRemoveBottom(
                          bottomIcon: Iconsax.minus,
                          onPree: () => cartCubit.quantityMinus(index: index),
                        ),
                        const  SizedBox(width: 15),
                        customText('${cartItem.quantity}'),
                        const  SizedBox(width: 15),
                        AddRemoveBottom(
                          bottomIcon: Iconsax.add,
                          onPree: () => cartCubit.quantityPlus(index: index),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) =>
                          (state is DeleteFromCartLoadingState &&
                              state.index == index)
                          ? CustomCupertinoIndicator()
                          : RemoveBottom(index: index),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget customText(String text)=>  Text(
    text ?? '',
    style: Styles.cardItemTitle,
    maxLines: 1,
  );
}
