import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/register_use_case.dart';
import '../state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase})
      : super(RegisterInitialState());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,}) async {
    emit(RegisterLoadingState());
    try {
      final result = await registerUseCase.call(firstName: firstName,
          lastName: lastName,
          email: email,
          password: password);
      emit(RegisterSuccessState(user: result));
    } catch (error) {
      emit(RegisterErrorState(message: error.toString()));
    }
  }
}
