import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yumzy/core/constants/colors.dart';

import 'features/auth/data/auth_cubit/auth_cubit.dart';
import 'features/cart/data/cart_cubit/cart_cubit.dart';
import 'features/home/data/hom_cubit/home_cubit.dart';
import 'features/home/data/hom_cubit/home_state.dart';
import 'features/orderHistory/data/order_cubit/order_cubit.dart';
import 'generated/l10n.dart';

class MainRootScreen extends StatelessWidget {
  const MainRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        var orderCubit = OrderCubit.get(context);
        var cartCubit = CartCubit.get(context);
        var authCubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: homeCubit.currantIndex,
            children: homeCubit.screen,
          ),

          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: BottomNavigationBar(
              iconSize: 25,
              backgroundColor: Colors.transparent,
              unselectedItemColor: Colors.grey[400],
              selectedFontSize: 18,
              onTap: (value) {
                homeCubit.bottomNavChange(value);
                if (value == 0 && homeCubit.products.isEmpty
                ) {
                  homeCubit.getProducts();
                }
                else if (value == 2 && orderCubit.orderHistory.isEmpty
                ) {
                  orderCubit.getOrderHistory();
                }
                else if (value == 1
                    && cartCubit.selectedCartItems.isEmpty
                ){
                  cartCubit.getCart();
                }
              },
              selectedItemColor: Colors.white,
              currentIndex: homeCubit.currantIndex,
              type: BottomNavigationBarType.fixed,
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.home_25),
                  label: S.of(context).home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.shopping_cart5),
                  label: S.of(context).cart,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_dining),
                  label: S.of(context).history,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.profile_tick5),
                  label: S.of(context).profile,
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
