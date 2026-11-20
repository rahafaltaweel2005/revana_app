import 'package:revana_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:revana_app/feature/auth/domain/entity/profile_entity.dart';
import 'package:revana_app/feature/auth/domain/entity/user_entity.dart';
import 'package:revana_app/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final model = await authRemoteDatasource.login(
      email: email,
      password: password,
    );
    return model.toEntity();
  }

  @override
  Future<ProfileEntity> profile() async {
    final model = await authRemoteDatasource.profile();
    return model.toEntity();
  }

  @override
  Future<UserEntity> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final model = await authRemoteDatasource.register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );
    return model.toEntity();
  }
}
