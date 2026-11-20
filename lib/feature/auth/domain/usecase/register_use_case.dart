import 'package:revana_app/feature/auth/domain/repository/auth_repository.dart';

import '../entity/user_entity.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<UserEntity> call({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    return authRepository.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password
    );
  }
}
