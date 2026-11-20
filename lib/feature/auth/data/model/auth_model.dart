import 'package:revana_app/feature/auth/domain/entity/user_entity.dart';

class AuthModel {
  String? token;
  String? email;
  String? role;

  AuthModel({this.token, this.email, this.role});

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }

  UserEntity toEntity() {
    return UserEntity(role: role!, token: token!, email: email!);
  }
}
