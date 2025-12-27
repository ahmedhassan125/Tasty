import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/product/widgets/topping_item_widget.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';
import '../../cart/data/cart_cubit/cart_state.dart';

class SideOptionListView extends StatelessWidget {
  const SideOptionListView({super.key});
  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final screenHeight = MediaQuery.of(context).size.height;


    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is GetSideOptionSuccessState ||
          current is SelectedSideOptionState ||
          current is GetSideOptionLoadingState,
      builder: (context, state) {
        if (state is GetSideOptionLoadingState) {
          return const CustomCupertinoIndicator();
        }
        if (cartCubit.sideOption.isEmpty) {
          return const SizedBox(
            height: 120,
            child: Center(child: Text('No Side option available')),
          );
        }
        return SizedBox(
          height:screenHeight * 0.155,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final sideOption = cartCubit.sideOption[index];
              final isSelected = cartCubit.selectedSideOption.contains(sideOption.id,);
              return ToppingItemWidget(
                isSelected: isSelected,
                addOption: () =>cartCubit.toggleSideOption(sideOption.id!),
                index: index,
                name: cartCubit.sideOption[index].name,
                image: cartCubit.sideOption[index].image,
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: cartCubit.sideOption.length,
          ),
        );
      },
    );
  }
}
