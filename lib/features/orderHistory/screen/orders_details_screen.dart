import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/orderHistory/data/order_cubit/order_state.dart';
import 'package:yumzy/shared/custom_bottom.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_app_bar.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import '../data/order_cubit/order_cubit.dart';
import '../widget/orders_details_item.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final orderCubit = OrderCubit.get(context);
    return BlocConsumer<OrderCubit, OrderState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(context: context),
          body: (state is GetOrderDetailsLoadingState)
              ? Center(child: const CustomCupertinoIndicator())
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => OrdersDetailsItem(item: orderCubit.ordersDetails[index],),
                          separatorBuilder: (context, index) =>const SizedBox(height: 10),
                          itemCount: orderCubit.ordersDetails.length,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            '${S.of(context).total}: ${orderCubit.reOrderModel.data?.totalPrice} ${S.of(context).EGP}',
                            style: Styles.boldTextStyle16,
                          ),
                          const Spacer(),
                          CustomBottom(bottomText: S.of(context).reOrder, onTap: () {}),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        );
      },
      listener: (context, state) {
        if (state is GetOrderDetailsErrorState) {
           AppSnackBar.error(context, state.error);
        }
      },
    );
  }
}
