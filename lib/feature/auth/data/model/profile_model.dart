import 'package:revana_app/feature/auth/domain/entity/profile_entity.dart';

class ProfileModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? createdAt;

  ProfileModel({this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.createdAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    data['createdAt'] = this.createdAt;
    return data;
  }

  ProfileEntity toEntity() {
    return ProfileEntity(firstName: firstName!,
        role: role!,
        lastName: lastName!,
        email: email!,
        createdAt: DateTime.parse(createdAt!),
        id: id!);
  }
}
