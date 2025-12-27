import 'package:yumzy/features/cart/data/cart_model/get_cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartLoadingState extends CartState {}

class AddToCartSuccessState extends CartState {}
class WarningCartState extends CartState {
  final String message;

  WarningCartState(this.message);
}


class AddToCartErrorState extends CartState {
  final String error;

  AddToCartErrorState(this.error);
}

class SliderChangeState extends CartState {}

class SelectedToppingState extends CartState {}

class SelectedSideOptionState extends CartState {}

class GetCartLoadingState extends CartState {}
class GetCartSuccessState extends CartState {
  final GetCartModel getCartModel;

  GetCartSuccessState(this.getCartModel);
}
class GetCartErrorState extends CartState {
  final String error;

  GetCartErrorState(this.error);
}





class DeleteFromCartLoadingState extends CartState {
final int index;

  DeleteFromCartLoadingState({required this.index});

}

class DeleteFromCartSuccessState extends CartState {
  final String message;

  DeleteFromCartSuccessState(this.message);
}

class DeleteFromCartErrorState extends CartState {
  final String error;

  DeleteFromCartErrorState(this.error);
}
class GetToppingLoadingState extends CartState {}
class GetToppingSuccessState extends CartState {}
class GetToppingErrorState extends CartState {
  final String error;
  GetToppingErrorState(this.error);


}

class GetSideOptionLoadingState extends CartState {}
class GetSideOptionSuccessState extends CartState {}
class GetSideOptionErrorState extends CartState {
  final String error;
  GetSideOptionErrorState(this.error);


}


class QuantityPlusState extends CartState {
  final int index;

  QuantityPlusState(this.index);
}

class QuantityMinusState extends CartState {

  final int index;

  QuantityMinusState(this.index);
}

class CartRestart extends CartState {}