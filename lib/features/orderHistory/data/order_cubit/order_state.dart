abstract class OrderState {}

class OrderInitial extends OrderState {}

class SaveOrderLoadingState extends OrderState {}
class SaveOrderSuccessState extends OrderState {}
class SaveOrderErrorState extends OrderState {
  final String error;
  SaveOrderErrorState(this.error);
}



class GetOrderLoadingState extends OrderState {}
class GetOrderSuccessState extends OrderState {}
class GetOrderErrorState extends OrderState {
  final String error;

  GetOrderErrorState(this.error);
}
class GetOrderWarningState extends OrderState {
  final String message;
  GetOrderWarningState(this.message);
}




class GetOrderDetailsLoadingState extends OrderState {
  final int index;

  GetOrderDetailsLoadingState({required this.index});
}
class GetOrderDetailsSuccessState extends OrderState {
  final int index;

  GetOrderDetailsSuccessState({required this.index});

}
class GetOrderDetailsErrorState extends OrderState {
  final String error;

  GetOrderDetailsErrorState(this.error);
}

class OrderRestartState extends OrderState {}



class CashState extends OrderState {}
class VisaState extends OrderState {}
class RestartOrder extends OrderState {}
class WarningOrderState extends OrderState {
  final String message;

  WarningOrderState(this.message);
}