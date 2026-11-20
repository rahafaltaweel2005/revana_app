import 'package:revana_app/core/constant/api_const.dart';
import 'package:revana_app/core/network/api_client.dart';
import 'package:revana_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:revana_app/feature/auth/data/model/auth_model.dart';
import 'package:revana_app/feature/auth/data/model/profile_model.dart';

class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(endpoint: ApiConst.login,
    data: {
      'email': email,
      'password': password,
    });
    return AuthModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> profile() async{
    final response =  await ApiClient.get(endpoint: ApiConst.profile);
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<AuthModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.register,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );
    return AuthModel.fromJson(response.data);
  }
}
