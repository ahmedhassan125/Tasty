


import '../models/auth_model.dart';
import '../models/profile_model.dart';
import '../models/register_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LogInLoading extends AuthState {}
class CheckAuthenticatedState extends AuthState {
  final String token;

  CheckAuthenticatedState(this.token);
}
class GuestState extends AuthState {}
class LogInSuccess extends AuthState {
  final UserModel user;
  LogInSuccess(this.user);
}

class LogInError extends AuthState {
  final String message;
  LogInError(this.message);
}



class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final RegisterMo user;

  RegisterSuccessState(this.user);
}

class RegisterErrorState extends AuthState {
  final String error;

  RegisterErrorState(this.error,);
}


class GetProfileLoadingState extends AuthState {}

class GetProfileSuccessState extends AuthState {
  final ProfileModel profile;
  GetProfileSuccessState(this.profile);
}

class GetProfileErrorState extends AuthState {
  final String message;
  GetProfileErrorState(this.message);
}




class LogOutLoadingState extends AuthState {}

class LogOutSuccessState extends AuthState {
  final String message;

  LogOutSuccessState(this.message);
}

class LogOutErrorState extends AuthState {
  final String message;
  LogOutErrorState(this.message);
}



class UpdateProfileLoadingState extends AuthState {}

class UpdateProfileSuccessState extends AuthState {
  final ProfileModel profile;

  UpdateProfileSuccessState({required this.profile});

}

class UpdateProfileErrorState extends AuthState {
  final String message;
  UpdateProfileErrorState(this.message);
}
class EditeVisa extends AuthState {}
class ProfileImageState extends AuthState {}
class WarningAuthtState extends AuthState {
  final String message;
  WarningAuthtState(this.message);
}


class ChangeLanguage extends AuthState {}
