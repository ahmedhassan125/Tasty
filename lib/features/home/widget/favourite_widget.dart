import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/styles.dart';
import '../data/hom_cubit/home_cubit.dart';
import '../data/hom_cubit/home_state.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({super.key, required this.index, required this.rating});
  final int index;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final homeCubit = HomeCubit.get(context);
    return Row(
      children: [
        const Icon(Iconsax.star1, size: 25, color: Colors.yellow),
        const SizedBox(width: 3),
        Text(rating, style: Styles.regularTextStyle14),
        Spacer(),
        BlocBuilder<HomeCubit, HomeStates>(
          builder: (context, state) {
            final favouriteProduct = homeCubit.products[index];
            return GestureDetector(
            onTap: () => homeCubit.toggleFavourite(index: index),
              child: favouriteProduct.isFavourite
                  ? Icon(Iconsax.heart_edit1, size: 25, color: Colors.red)
                  : Icon(Iconsax.heart, size: 25),
            );
          },
        ),
      ],
    );
  }
}
