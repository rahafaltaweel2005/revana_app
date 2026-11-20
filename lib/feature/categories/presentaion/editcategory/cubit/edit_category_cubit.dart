import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/edit_category_use_case.dart';
import '../state/edit_category_state.dart';

class EditCategoryCubit extends Cubit<EditCategoryState> {
  final EditCategoryUseCase editCategoryUseCase;

  EditCategoryCubit({required this.editCategoryUseCase})
    : super(EditCategoryInitialState());

  Future<void> editCategory({
    required String id,
    required String name,
  }) async {
    emit(EditCategoryLoadingState());
    try {
      final result = await editCategoryUseCase.call(id, name);
      emit(EditCategorySuccessState(category: result));
    } catch (error) {
      emit(EditCategoryErrorState(message: error.toString()));
    }
  }
}
