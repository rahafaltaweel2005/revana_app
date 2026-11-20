import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/delete_category_use_case.dart';
import '../state/delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  final DeleteCategoryUseCase deleteCategoryUseCase;

  DeleteCategoryCubit({required this.deleteCategoryUseCase})
    : super(DeleteCategoryInitialState());

  Future<void> deleteCategory({required String id}) async {
    emit(DeleteCategoryLoadingState());
    try {
      await deleteCategoryUseCase.call(id);
      emit(DeleteCategorySuccessState());
    } catch (error) {
      emit(DeleteCategoryErrorState(message: error.toString()));
    }
  }
}
