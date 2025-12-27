import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/core/constants/colors.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_state.dart';
import 'package:yumzy/main_root_screen.dart';
import 'package:yumzy/shared/app_string.dart';
import 'package:yumzy/shared/custom_bottom.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_app_bar.dart';
import '../../../shared/custom_bottom_navigation.dart';
import '../../auth/data/auth_cubit/auth_cubit.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../home/data/models/all_product_model.dart';
import '../widgets/sideOption_listView_widget.dart';
import '../widgets/spicy_widget.dart';
import '../widgets/topping_listView_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key, required this.product});
  final Data product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final authCubit = AuthCubit.get(context);
    return BlocListener<CartCubit, CartState>(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(context: context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpicyWidget(product: product),
                const SizedBox(height: 15),
                 Text(S.of(context).toppings, style: Styles.boldTextStyle18),
                const SizedBox(height: 15),
                const ToppingListView(),
                const SizedBox(height: 15),
                 Text(S.of(context).sideOptions, style: Styles.boldTextStyle18),
                const SizedBox(height: 15),
                const SideOptionListView(),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
          buildWhen: (previous, current) =>
              current is AddToCartLoadingState ||
              current is AddToCartSuccessState ||
              current is AddToCartErrorState,
          builder: (context, state) => CustomBottomNavigation(
            price: '${product.price} ${S.of(context).EGP}',
            bottom: (state is AddToCartLoadingState) ?
            const CustomCupertinoIndicator(
                    width: 140,
                    height: 40,
                    color: kPrimaryColor,
                  )
                : CustomBottom(
                    height: 40,
                    width: 140,
                    bottomText: S.of(context).addToCart,
                    onTap: () {
                      cartCubit.addToCart(
                        productId: product.id!,
                        quantity: 1,
                        toppings: cartCubit.selectedTopping,
                        sideOptions: cartCubit.selectedSideOption,
                        spicy: cartCubit.sliderValue,
                      );
                    },
                  ),
          ),
        ),
      ),
      listener: (context, state) {
        if (state is AddToCartSuccessState) {
          AppSnackBar.success(context, AppString.addToCartSuccess);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainRootScreen()),
          );
        } else
         if (state is AddToCartErrorState ||
            state is GetToppingErrorState ||
            state is GetSideOptionErrorState) {
          AppSnackBar.error(context, (state as dynamic).error);
        }else if (state is WarningCartState){
           AppSnackBar.warning(context, state.message);
         }
      },
    );
  }
}
