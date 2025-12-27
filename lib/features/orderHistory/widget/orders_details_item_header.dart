import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/custom_cupertino_indicator.dart';
import '../data/models/re_order_model.dart';

class OrdersDetailsItemHeader extends StatelessWidget {
  const OrdersDetailsItemHeader({super.key, required this.item});
  final OrdersDetailsItems item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: AspectRatio(
            aspectRatio: 0.7,
            child: CachedNetworkImage(
              imageUrl: item.image ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 40),
              placeholder: (context, url) => const CustomCupertinoIndicator(),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textRow(label: S.of(context).name, value: '${item.name}'),
              const SizedBox(height: 15),
              textRow(label: S.of(context).quantity, value: '${item.quantity}'),
              const SizedBox(height: 15),
              textRow(label: S.of(context).price, value: '${item.price} ${S.of(context).EGP}'),
            ],
          ),
        ),
      ],
    );
  }

  Widget textRow({required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.boldTextStyle16,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: Styles.regularTextStyle16,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
