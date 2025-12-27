import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yumzy/features/orderHistory/data/order_cubit/order_state.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/shared_screen/empty_skeletonizer_Widget.dart';
import '../../../shared/shared_screen/guest_screen_widget.dart';
import '../../auth/data/auth_cubit/auth_cubit.dart';
import '../data/order_cubit/order_cubit.dart';
import '../widget/orders_history_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final orderCubit = OrderCubit.get(context);
    final authCubit = AuthCubit.get(context);

    return BlocConsumer<OrderCubit, OrderState>(
      listenWhen: (previous, current) =>
          current is GetOrderErrorState ||
          current is GetOrderDetailsErrorState ||
          current is WarningOrderState ||
          current is GetOrderDetailsSuccessState,
      builder: (context, state) {
        if (authCubit.token == null) {
          return GuestScreenWidget(text: S.of(context).showOrderHistory);
        }
        else if (orderCubit.orderHistory.isEmpty && state is! GetOrderLoadingState) {
          return  Center(
            child: Text(S.of(context).noOrder, style: Styles.boldTextStyle20),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Expanded(
                child: Skeletonizer(
                  enabled: state is GetOrderLoadingState,
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        state is GetOrderLoadingState
                        ? EmptySkeletonizerWidget()
                        : OrderHistoryWidget(index: index),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: state is GetOrderLoadingState
                        ? 4
                        : orderCubit.orderHistory.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {
        if (state is GetOrderErrorState) {
          AppSnackBar.error(context, state.error);
        } else if (state is GetOrderDetailsErrorState) {
          AppSnackBar.error(context, state.error);
        } else if (state is GetOrderDetailsSuccessState ) {
          context.push('/OrdersDetailsScreen');
        } else if (state is GetOrderWarningState) {
          AppSnackBar.warning(context, state.message);
        }else if (state is WarningOrderState) {
          AppSnackBar.warning(context, state.message);
        }
      },
    );
  }
}
