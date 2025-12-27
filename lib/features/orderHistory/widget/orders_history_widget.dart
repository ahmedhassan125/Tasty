import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yumzy/core/constants/colors.dart';
import 'package:yumzy/features/orderHistory/data/order_cubit/order_cubit.dart';
import 'package:yumzy/features/orderHistory/widget/re_order_bottom_widget.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';


class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({super.key,  required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final orderHistoryItem = OrderCubit.get(context).orderHistory[index];
    final cardHeight = MediaQuery.of(context).size.height * 0.25;
    final orderCubit = OrderCubit.get(context);
    return SizedBox(
      height: cardHeight,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.52,
                          child: CachedNetworkImage(
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported),
                            placeholder: (context, url) =>
                                CustomCupertinoIndicator(),
                            imageUrl: orderHistoryItem.productImage ?? '',
                          ),
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textRow(
                            text: '${S.of(context).price} ${orderHistoryItem.totalPrice} ${S.of(context).EGP}',
                          ),
                          textRow(text: orderHistoryItem.createdAt ?? ''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ReOrderBottom(
                  index: index,
                  bottomText: S.of(context).orderDetails,
                  onTap: () async{
                   await orderCubit.getOrderDetails(
                      id: '${orderHistoryItem.id}',
                      index: index,
                    );
                  },
                  bottomColor: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textRow({required String text}) =>
    Text(text, style: Styles.cardItemTitle, maxLines: 1);
