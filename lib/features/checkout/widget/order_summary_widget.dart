import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
import '../../../core/remot_config_service.dart';
import '../../../generated/l10n.dart';
import '../../cart/data/cart_cubit/cart_cubit.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).orderSummary, style: Styles.boldTextStyle18),
        const SizedBox(height: 20),
        RemoteConfigService.currencyy() ? summaryRow(S.of(context).order, '${cartCubit.totalPrice.toString()} ${S.of(context).usd}') :summaryRow(S.of(context).order, '${cartCubit.totalPrice.toString()} ${S.of(context).EGP}'),
        const SizedBox(height: 16),
        RemoteConfigService.currencyy() ? summaryRow(S.of(context).taxes, '${cartCubit.tax.toStringAsFixed(2)} ${S.of(context).usd}'): summaryRow(S.of(context).taxes, '${cartCubit.tax.toStringAsFixed(2)} ${S.of(context).EGP}'),
        const SizedBox(height: 16),
        RemoteConfigService.currencyy() ?  summaryRow(S.of(context).deliveryFees, '${cartCubit.delivery} ${S.of(context).usd}'): summaryRow(S.of(context).deliveryFees, '${cartCubit.delivery} ${S.of(context).EGP}'),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 20),
        RemoteConfigService.currencyy() ? summaryRow(S.of(context).totalFees, '${cartCubit.finalPrice} ${S.of(context).usd}', bold: true) :summaryRow(S.of(context).totalFees, '${cartCubit.finalPrice} ${S.of(context).EGP}', bold: true),
        const SizedBox(height: 20),
        summaryRow(S.of(context).deliveryTime, '15 - 30 ${S.of(context).mins}', bold: true),
      ],
    );
  }
  Widget summaryRow(String text, String value, {bool bold = false}) {
    return Row(
      children: [
        Text(
          text,
          style: bold ? Styles.boldTextStyle18 : Styles.gryRegularTextStyle18,
        ),
        const Spacer(),
        Text(value, style: Styles.gryRegularTextStyle18),
      ],
    );
  }
}
