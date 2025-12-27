import 'package:flutter/material.dart';
import '../../product/widgets/topping_item_widget.dart';
import '../data/models/re_order_model.dart';
class OrdersDetailsExtra extends StatelessWidget {
  const OrdersDetailsExtra({super.key, required this.itemList});
  final List<Extra> itemList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.155,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ToppingItemWidget(
            isSelected: true,
            index: index,
            image: itemList[index].image ?? '',
            name: itemList[index].name ?? '',
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: itemList.length,
      ),
    );
  }
}
