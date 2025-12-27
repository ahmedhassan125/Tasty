import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_state.dart';
import 'package:yumzy/shared/custom_snak_bar.dart';
import '../../../core/constants/styles.dart';
import '../../../generated/l10n.dart';
import '../../../shared/shared_screen/empty_skeletonizer_home_widget.dart';
import '../../auth/data/auth_cubit/auth_cubit.dart';
import '../data/hom_cubit/home_cubit.dart';
import '../data/hom_cubit/home_state.dart';
import '../widget/category_buldier.dart';
import '../widget/grid_view_builder.dart';
import '../widget/home_screen_app_bar.dart';
import '../widget/home_screen_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      buildWhen: (previous, current) =>
          current is GetProductsLoadingState ||
          current is GetProductsSuccessState ||
          current is GetProductsByCategorySuccessState ||
          current is GetProductsByCategoryLoadingState ||
          current is GetCategorySuccessState ||
          current is SearchProductsState,
      listenWhen: (previous, current) =>
          current is GetProductsErrorState ||
          current is GetProductsByCategoryErrorState ||
          current is GetCategorySuccessState,
      builder: (context, state) {
        final homeCubit = HomeCubit.get(context);
        final authCubit = AuthCubit.get(context);
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  const HomeScreenAppBar(),
                  BlocBuilder<AuthCubit,AuthState>(builder: (context, state) => Text(
                    '${S.of(context).welcome} ${authCubit.currentUser?.name ?? ''} 👋', style: Styles.regularTextStyle18,),),
                  const HomeScreenSearchBar(),
                  homeCubit.isSelected
                      ? Align(
                    alignment: Alignment.centerLeft,
                        child: Text(
                          '${homeCubit.searchItems.length} item found',
                          style: Styles.gryRegularTextStyle14,
                        ),
                      )
                      : const SizedBox(height: 15),
                  const CategoryBuilder(),
                  const SizedBox(height: 15),
                  Skeletonizer(
                    enabled: state is GetProductsLoadingState || state is GetProductsByCategoryLoadingState,
                        child: GridView.builder(
                          itemCount: state is GetProductsLoadingState? 4: homeCubit.searchItems.length,
                          itemBuilder: (context, index) =>
                          state is GetProductsLoadingState? EmptySkeletonizerHomeWidget(): GridViewBuilder(index: index),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  childAspectRatio: .70,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                ),
                          ),
                      ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is GetCategoryErrorState ) {
          AppSnackBar.error(context, state.error);
        }
        else if (state is GetProductsErrorState) {
          AppSnackBar.error(context, state.error);
        } else if (state is GetProductsByCategoryErrorState) {
          AppSnackBar.error(context, state.error);
        }
      },
    );
  }
}
