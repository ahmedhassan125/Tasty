import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yumzy/core/constants/colors.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:yumzy/features/home/data/hom_cubit/home_cubit.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../product/screens/products_screen.dart';
import 'favourite_widget.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final cartCubit = CartCubit.get(context);
    final homeCubit = HomeCubit.get(context);
    final product = homeCubit.searchItems[index];
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(product: product),
          ),
        );
        cartCubit.getAddition();
      },
      child: Card(
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
                    imageUrl: '${product.image}',
                    placeholder: (context, url) => const CustomCupertinoIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
              customText(text: product.name ?? ''),
              customText(text: product.description ?? ''),
              const SizedBox(height: 10),
              FavouriteWidget(index: index,rating: product.rating ?? '',),
              const SizedBox(height: 5),
              customText(text: '${double.parse(product.price!).toInt()} ${S.of(context).EGP}',),
            ],
          ),
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
