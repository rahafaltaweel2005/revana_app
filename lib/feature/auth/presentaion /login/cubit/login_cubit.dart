import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revana_app/feature/auth/presentaion%20/login/state/login_state.dart';

import '../../../../../core/constant/app_const.dart';
import '../../../../../core/storage/secure_storage_helper.dart';
import '../../../domain/usecase/login_use_case.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      final result = await loginUseCase.call(email: email, password: password);
      await SecureStorageHelper.write(
        key: AppConst.accessTokenKey,
        value: result.token,
      );

      emit(LoginSuccessState(user: result));
    } catch (error) {
      emit(LoginErrorState(message: error.toString()));
    }
  }
}
