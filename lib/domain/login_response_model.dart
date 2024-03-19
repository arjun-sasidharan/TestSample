class LoginResponseModel {
  String? title;
  String? message;
  User? data;

  LoginResponseModel({this.title, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  String? userToken;
  String? id;
  String? name;
  String? mobile;
  String? email;

  User({this.userToken, this.id, this.name, this.mobile, this.email});

  User.fromJson(Map<String, dynamic> json) {
    userToken = json['user_token'];
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_token'] = userToken;
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    return data;
  }
}
