import 'package:flutter/material.dart';
import 'package:yumzy/shared/app_string.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../data/models/re_order_model.dart';
import 'orders_details_extra.dart';
import 'orders_details_item_header.dart';

class OrdersDetailsItem extends StatelessWidget {
  const OrdersDetailsItem({super.key, required this.item});
  final OrdersDetailsItems item;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrdersDetailsItemHeader(item: item),
            const SizedBox(height: 15),
             Text(S.of(context).toppings, style: Styles.boldTextStyle18),
            const SizedBox(height: 15),
            (item.toppings!.isEmpty) ? Center(child: Text(AppString.noTopping)) :
                  OrdersDetailsExtra(itemList: item.toppings ?? []),
            const SizedBox(height: 15),
             Text(S.of(context).sideOptions, style: Styles.boldTextStyle18),
            const SizedBox(height: 15),
            (item.sideOptions!.isEmpty) ? Center(child: Text(AppString.noSideOptions)) :
                  OrdersDetailsExtra(itemList: item.sideOptions ?? []),
          ],
        ),
      ),
    );
  }
}
