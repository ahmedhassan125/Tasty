import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/constants/styles.dart';

class EmptySkeletonizerHomeWidget extends StatelessWidget {
  const EmptySkeletonizerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: 1.2,
                child: CachedNetworkImage(
                  imageUrl: 'test',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            customText(text: 'product.name  '),
            customText(text: 'product.description ' ),
            const SizedBox(height: 10),
            customText(text: '150 EGP',),
          ],
        ),
      ),
    );
  }
}
Widget customText({required String text}) => Text(
  text ,
  maxLines: 1,
  style: Styles.regularTextStyle14,
  overflow: TextOverflow.ellipsis,
);