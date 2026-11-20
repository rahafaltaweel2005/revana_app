import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revana_app/feature/auth/domain/usecase/get_profile_use_case.dart';

import '../state/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileCubit({required this.getProfileUseCase}) : super(ProfileInitialState());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final result = await getProfileUseCase.call();
      emit(ProfileLoadedState(user: result));
    } catch (error) {
      emit(ProfileErrorState(message: error.toString()));
    }
  }
}
