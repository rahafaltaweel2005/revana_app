import 'package:revana_app/feature/auth/domain/entity/profile_entity.dart';

import '../repository/auth_repository.dart';

class GetProfileUseCase {
  final AuthRepository authRepository;

  GetProfileUseCase({required this.authRepository});

  Future<ProfileEntity> call(){
    return authRepository.profile();
  }
}