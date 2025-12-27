class UserModel {
  final int code;
  final String message;
  final String? token;
  final String? name;
  final String? email;
  final String? image;

  UserModel({
    required this.code,
    required this.message,
    this.token,
    this.name,
    this.email,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final dynamic data = json['data'];
    final Map<String, dynamic> userData = (data is List && data.isNotEmpty)
        ? data[0]
        : (data ?? {});
    return UserModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      token: userData['token'],
      name: userData['name'],
      email: userData['email'],
      image: userData['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': {'token': token, 'name': name, 'email': email, 'image': image},
    };
  }
}
