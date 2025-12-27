import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/product/widgets/topping_item_widget.dart';

import '../../../shared/custom_cupertino_indicator.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../cart/data/cart_cubit/cart_state.dart';

class ToppingListView extends StatelessWidget {
  const ToppingListView({super.key});
  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is GetToppingSuccessState ||
          current is GetToppingErrorState ||
          current is SelectedToppingState ||
          current is GetToppingLoadingState,
      builder: (context, state) {
        if (state is GetToppingLoadingState ||state is GetSideOptionLoadingState) {
          return const CustomCupertinoIndicator();
        }
        if (cartCubit.topping.isEmpty) {
          return const SizedBox(
            height: 120,
            child: Center(child: Text('No toppings available')),
          );
        }
        return SizedBox(
          height:screenHeight * 0.155,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final topping = cartCubit.topping[index] ?? [];
              final isSelected = cartCubit.selectedTopping.contains(topping.id);
              return ToppingItemWidget(
                isSelected: isSelected,
                addOption:() => cartCubit.toggleTopping(topping.id!),
                index: index,
                image: topping.image ?? '',
                name: topping.name ?? '',
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: cartCubit.topping.length,
          ),
        );
      },
    );
  }
}
