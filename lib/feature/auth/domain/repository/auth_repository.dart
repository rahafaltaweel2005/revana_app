import 'package:revana_app/feature/auth/domain/entity/profile_entity.dart';

import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<UserEntity> login({required String email, required String password});

  Future<ProfileEntity> profile();
}
