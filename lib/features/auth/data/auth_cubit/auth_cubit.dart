import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumzy/core/network/api_service.dart';
import 'package:yumzy/core/network/dio_helper.dart';
import 'package:yumzy/core/network/secure_storege_helper.dart';
import 'package:yumzy/features/auth/data/auth_cubit/auth_state.dart';
import 'package:yumzy/features/auth/data/models/auth_model.dart';
import '../repo/auth_repo.dart';
import '../models/profile_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(DioHelper dioHelper) :  authRepo = AuthRepo(ApiService(dioHelper)), super(AuthInitial());
  AuthCubit.test(this.authRepo) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

 // final AuthRepo authRepo = AuthRepo();
 // final OrderCubit orderCubit = OrderCubit(DioHelper());
 // final CartCubit cartCubit = CartCubit();

  //******************************************* Log IN//***************************************
  UserModel? currentUser;
  String? token;

  Future<void> logIn({required String email, required String password}) async {
    emit(LogInLoading());
    try {
      final user = await authRepo.logIn(email: email, password: password);
      currentUser = user;
      if (user.token != null && user.token!.isNotEmpty) {
        await SecureStorageHelper.saveToken(user.token!);
        token = user.token;
      }
      emit(LogInSuccess(user));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(LogInError(error.toString()));
    }
  }

  //******************************************* Register //***************************************
  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingState());
      final response = await authRepo.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      if (response.data?.token != null && response.data!.token!.isNotEmpty) {
        await SecureStorageHelper.saveToken(response.data!.token!);
        token = response.data!.token;
      }
      emit(RegisterSuccessState(response));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(RegisterErrorState(error.toString()));
    }
  }
  //******************************************* CheckAuthenticated  //***************************************
  Future<void> checkAuthState(String? initialToken) async {
    if (initialToken != null && initialToken.isNotEmpty) {
      token = initialToken;
      emit(CheckAuthenticatedState(token!));
    } else {
      final storedToken = await SecureStorageHelper.getToken();
      if (storedToken != null && storedToken.isNotEmpty) {
        token = storedToken;
        emit(CheckAuthenticatedState(token!));
      } else {
        emit(GuestState());
      }
    }
  }

  // Future<void>checkAuthState(String? initialToken)async{
  //   final token = await SecureStorageHelper.getToken();
  //   if(token !=null && token.isNotEmpty){
  //     emit(CheckAuthenticatedState(token));
  //
  //   }else{
  //     emit(GuestState());
  //   }
  //
  //
  // }
  //******************************************* Get Profile  //***************************************

  ProfileModel? profile;
  Future<void> getProfileData() async {
    emit(GetProfileLoadingState());
    if (await _needLogin()) return;
    try {
      final response = await authRepo.getProfileData();
      profile = response;
      initControllers();
      emit(GetProfileSuccessState(response));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(GetProfileErrorState(error.toString()));


    }
  }

  //******************************************* Log Out //***************************************
  Future<void> logOut() async {
    emit(LogOutLoadingState());
    try {
      if (await _needLogin()) return;
      final response = await authRepo.logOut();
      await SecureStorageHelper.clearToken();
      resetUserDate();
      resetController();
      emit(LogOutSuccessState(response['message']));
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(LogOutErrorState(error.toString()));
    }
  }
  //******************************************* Update Profile //***************************************

  Future<void> updateProfile({
    String? name,
    String? email,
    String? address,
    String? image,
    String? visa,
  }) async {
    if (await _needLogin()) return;
    emit(UpdateProfileLoadingState());
    try {
      final response = await authRepo.upDateProfile(
        name: name,
        email: email,
        address: address,
        image: image,
        visa: visa,
      );
      profile = response;
      emit(UpdateProfileSuccessState(profile: response));
      isSelected =false;
      await getProfileData();
    } catch (error,stackTrace) {
      addError(error, stackTrace);
      emit(UpdateProfileErrorState(error.toString()));
    }
  }

  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? addressController;
  TextEditingController? paymentController;
  void initControllers() {
    nameController ??= TextEditingController(text: profile?.data?.name ?? '');
    emailController ??= TextEditingController(text: profile?.data?.email ?? '');
    addressController ??= TextEditingController(text: profile?.data?.address ?? '',);
    paymentController ??= TextEditingController(text: profile?.data?.visa ?? '',);
  }

  void resetController(){
    nameController = null;
    emailController = null;
    addressController = null;
    paymentController = null;
  }
  void resetUserDate(){
    token = null;
    currentUser = null;
    profile = null;
  }
  bool isSelected = false;

  void editeVisa() {
    isSelected = !isSelected;
    emit(EditeVisa());
  }

  // String? profileImage;
  // final ImagePicker picker = ImagePicker();
  //
  // Future<void> pickedProfileImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery,);
  //   if(pickedFile != null){
  //     profileImage = pickedFile.path;
  //     emit(ProfileImageState());
  //   }
  //
  // }
  //

  Future<bool> _needLogin() async {
    final token = await SecureStorageHelper.getToken();
    if (token == null || token.trim().isEmpty) {
      emit(WarningAuthtState("You must log in to continue",));
      return true;
    }
    return false;
  }


  bool isEnglish = true;
  bool isArabic = false;

  void arabicLanguage(){
    isEnglish = false;
    isArabic = true;
    emit(ChangeLanguage());
  }

  void englishLanguage(){
    isEnglish = true;
    isArabic = false;
    emit(ChangeLanguage());
  }
}
