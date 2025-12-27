import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/core/constants/colors.dart';
import 'package:yumzy/core/constants/styles.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:yumzy/features/orderHistory/data/order_cubit/order_state.dart';
import 'package:yumzy/shared/custom_bottom.dart';
import 'package:yumzy/shared/custom_bottom_navigation.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../core/remot_config_service.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_app_bar.dart';
import '../../home/data/hom_cubit/home_cubit.dart';
import '../../orderHistory/data/order_cubit/order_cubit.dart';
import '../widget/dialog_ widget.dart';
import '../widget/order_summary_widget.dart';
import '../widget/payment_method_widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    final orderCubit = OrderCubit.get(context);
    final cartCubit = CartCubit.get(context);
    final homeCubit = HomeCubit.get(context);
    return BlocConsumer<OrderCubit, OrderState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(context: context),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                const OrderSummaryWidget(),
                const SizedBox(height: 70),
                Text(S.of(context).paymentMethods, style: Styles.boldTextStyle20),
                const SizedBox(height: 20),
                PaymentMethodWidget(
                  color: const Color(0xff3C2F2F),
                  text: S.of(context).cashOnDelivery,
                  isSelected: orderCubit.cash,
                  imagePath: 'assets/images/cashon.png',
                  onTap: orderCubit.cashPayment,
                ),
                const SizedBox(height: 20),
                PaymentMethodWidget(
                  color: Colors.blue,
                  text: S.of(context).payOnline,
                  isSelected: orderCubit.visa,
                  imagePath: 'assets/images/visa.png',
                  onTap: orderCubit.visaPayment,
                ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigation(
            price: RemoteConfigService.currencyy() ? '${cartCubit.finalPrice.toString()} ${S.of(context).usd}' : '${cartCubit.finalPrice.toString()} ${S.of(context).EGP}',
            bottom: (state is SaveOrderLoadingState)
                ? Center(
                    child: CustomCupertinoIndicator(
                      color: kPrimaryColor,
                      radius: 15,
                      height: 50,
                      width: 180,
                    ),
                  )
                : CustomBottom(
                    bottomText: S.of(context).payNaw,
                    onTap: () async {
                      homeCubit.bottomNavChange(0) ;
                      final selectedItems = cartCubit.convertSelectedItems();
                      await orderCubit.saveOrder(selectedCartItems: selectedItems,);
                      orderCubit.getOrderHistory();
                    },
                  ),
          ),
        );
      },
      listener: (context, state) {
        if (state is SaveOrderSuccessState) {
          showAdaptiveDialog(
            context: context,
            builder: (context) => DialogWidget(
              title: S.of(context).success,
              text: S.of(context).paymentSuccess,
              icon: Icons.check,
            ),
          );
        } else if (state is SaveOrderErrorState) {
          AppSnackBar.error(context, state.error);
        }
        else if (state is WarningOrderState){AppSnackBar.warning(context, state.message);}
      },
    );
  }
}
