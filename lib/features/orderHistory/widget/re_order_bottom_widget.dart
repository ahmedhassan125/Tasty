import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/orderHistory/data/order_cubit/order_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import '../data/order_cubit/order_state.dart';
import '../screen/orders_details_screen.dart';

class ReOrderBottom extends StatelessWidget {
  const ReOrderBottom({
    super.key,
    required this.bottomText,
    required this.index,
    required this.onTap,
    this.bottomColor,
  });
  final String bottomText;
  final int index;
  final Color? bottomColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is GetOrderDetailsLoadingState && state.index == index) {
          return const CustomCupertinoIndicator();
        }
        return InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: bottomColor ?? kPrimaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                bottomText,
                style: Styles.regularTextStyle18.copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
