import 'package:revana_app/feature/auth/domain/repository/auth_repository.dart';

import '../entity/user_entity.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<UserEntity> call({
    required String email,
    required String password,
  }) {
    return authRepository.login(email: email, password: password);
  }
}
