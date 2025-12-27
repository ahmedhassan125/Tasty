import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:yumzy/features/cart/data/cart_cubit/cart_state.dart';
import 'package:yumzy/shared/custom_cupertino_indicator.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../home/data/models/all_product_model.dart';

class SpicyWidget extends StatelessWidget {
  const SpicyWidget({super.key, required this.product});
  final Data product;

  @override
  Widget build(BuildContext context) {
    var cubit = CartCubit.get(context);
    final   screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.35,
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: .7,
              child: CachedNetworkImage(
                placeholder: (context, url) => const CustomCupertinoIndicator(),
                imageUrl: '${product.image}',
              ),
            ),
          ),
         const SizedBox(width: 20,),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).spicySlider,
                  maxLines: 3,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 15),
                Text(S.of(context).spicy, style: Styles.regularTextStyle14),
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      current is SliderChangeState,
                  builder: (context, state) => Slider(
                    min: 0.00,
                    max: 1.00,
                    activeColor: kPrimaryColor,
                    inactiveColor: Colors.grey,
                    value: cubit.sliderValue,
                    onChanged: (value) {
                      cubit.sliderChange(value);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('❄️'), Text('🔥')],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
