import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/colors.dart';
import '../data/hom_cubit/home_cubit.dart';
import '../data/hom_cubit/home_state.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(cubit.categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    cubit.categorySelected(index);
                    cubit.getProductsByCategory(id: index + 1);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: cubit.selectedIndex == index
                          ? kPrimaryColor
                          : kCategoryBuilderColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        cubit.categories[index].name!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: cubit.selectedIndex == index
                              ? Colors.white
                              : kCategoryBuilderFontColor,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
