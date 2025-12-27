import 'package:yumzy/features/home/data/models/all_product_model.dart';

import '../models/category_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class BottomNavChange extends HomeStates {}
class CategorySelectedChange extends HomeStates {}
class SearchProductsState extends HomeStates {}
class IsFavouriteStateChange extends HomeStates{
  final int index;
  IsFavouriteStateChange({required this.index});
}




class GetCategoryLoadingState extends HomeStates {}
class GetCategorySuccessState extends HomeStates {
  final CategoryModel category;
  GetCategorySuccessState(this.category);
}
class GetCategoryErrorState extends HomeStates {
  final String error;
  GetCategoryErrorState(this.error);
}


class GetProductsLoadingState extends HomeStates {}
class GetProductsSuccessState extends HomeStates {
  final FullProduct fullProduct;

  GetProductsSuccessState(this.fullProduct);
}
class GetProductsErrorState extends HomeStates {
  final String error;
  GetProductsErrorState(this.error);
}


class GetProductsByCategoryLoadingState extends HomeStates {}
class GetProductsByCategorySuccessState extends HomeStates {
  final FullProduct fullProduct;
  GetProductsByCategorySuccessState(this.fullProduct);
}
class GetProductsByCategoryErrorState extends HomeStates {
  final String error;
  GetProductsByCategoryErrorState(this.error);
}


class ToggleFavouriteLoadingState extends HomeStates {}
class ToggleFavouriteSuccessState extends HomeStates {}
class ToggleFavouriteErrorState extends HomeStates {
  final String error;
  ToggleFavouriteErrorState(this.error);
}




