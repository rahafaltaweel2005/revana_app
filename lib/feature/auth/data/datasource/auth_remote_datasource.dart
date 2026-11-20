import 'package:revana_app/feature/auth/data/model/auth_model.dart';
import 'package:revana_app/feature/auth/data/model/profile_model.dart';

abstract class AuthRemoteDatasource {
  Future <AuthModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future <AuthModel> login({
    required String email,
    required String password,
  });

  Future <ProfileModel> profile();
}
