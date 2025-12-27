class ProfileModel {
  int? code;
  String? message;
  Data? data;

  ProfileModel({this.code, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? email;
  String? image;
  String? address;
  String? visa;

  Data({this.name, this.email, this.image, this.address, this.visa});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
    visa = json['Visa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['address'] = this.address;
    data['Visa'] = this.visa;
    return data;
  }
}
