import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../generated/l10n.dart';
import '../../../shared/shared_screen/empty_skeletonizer_Widget.dart';
import '../../../shared/shared_screen/guest_screen_widget.dart';
import '../../auth/data/auth_cubit/auth_cubit.dart';
import '../data/cart_cubit/cart_cubit.dart';
import '../data/cart_cubit/cart_state.dart';
import '../widgets/empty_cart_widget.dart';
import '../widgets/cart_screen_builder.dart';
import '../widgets/checkout_item_builder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final authCubit = AuthCubit.get(context);
    return BlocConsumer<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is DeleteFromCartSuccessState ||
          current is GetCartSuccessState ||
          current is GetCartLoadingState ||
          current is QuantityMinusState ||
          current is CartRestart ||
          current is QuantityPlusState,
      listenWhen: (previous, current) =>
          current is DeleteFromCartSuccessState ||
          current is DeleteFromCartErrorState ||
          current is WarningCartState ||
          current is GetCartErrorState,
      builder: (context, state) {
        if (authCubit.token== null ) {
          return GuestScreenWidget(text: S.of(context).cartGuest);
        } else if (cartCubit.selectedCartItems.isEmpty  && state is! GetCartLoadingState) {
          return const EmptyCartWidget();
        }
        else {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Skeletonizer(
                      enabled: state is GetCartLoadingState,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => state is GetCartLoadingState ?EmptySkeletonizerWidget() :CartScreenBuilder(index: index),
                        separatorBuilder: (context, index) => const SizedBox(height: 10),
                        itemCount: state is GetCartLoadingState ? 1 : cartCubit.selectedCartItems.length,
                      ),
                    ),
                  ),
                  const CheckoutItemBuilder(),
                ],
              ),
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is DeleteFromCartSuccessState) {
          AppSnackBar.success(context, S.of(context).itemDeleted);
          cartCubit.getCart();
        } else if (state is DeleteFromCartErrorState) {
          AppSnackBar.error(context, state.error);
        } else if (state is GetCartErrorState) {
          AppSnackBar.error(context, state.error);
        }else if (state is WarningCartState){
          AppSnackBar.warning(context, state.message);
        }
      },
    );
  }
}
