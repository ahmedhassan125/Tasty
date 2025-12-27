import '../../../../core/network/api_service.dart';
import '../models/auth_model.dart';
import '../models/profile_model.dart';
import '../models/register_model.dart';

class AuthRepo {
  final ApiService apiService;
  AuthRepo(this.apiService);

 //final ApiService apiService = ApiService();

  //******************************************* Log In   //***************************************

  Future<UserModel> logIn({
    required String email,
    required String password,
  }) async {
    final response = await apiService.postData(
      endPoint: '/login',
      data: {'email': email, 'password': password},
    );
    return UserModel.fromJson(response);
  }

  //******************************************* RegisterMo  //***************************************

  Future<RegisterMo> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await apiService.postData(
      endPoint: '/register',
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );
    return RegisterMo.fromJson(response);
  }
  //******************************************* Get Profile   //***************************************

  Future<ProfileModel> getProfileData(
      ) async {
    final response = await apiService.getData(
      endpoint: '/profile',
    );
    return ProfileModel.fromJson(response);
  }

  //******************************************* Log Out  //***************************************

  Future<dynamic> logOut() async {
    final response = await apiService.postData(
      endPoint: '/logout',
    );
    return response;
  }
  //******************************************* UpDate Profile   //***************************************

  Future<ProfileModel> upDateProfile({
    String? name,
    String? email,
    String? address,
    String? image,
    String? visa,
  }) async {
    final response = await apiService.postData(
      endPoint: '/update-profile',
      data: {
        'name': name,
        'email': email,
        'address': address,
        'image': image,
        'Visa': visa,
      },
    );
    return ProfileModel.fromJson(response);
  }
}
