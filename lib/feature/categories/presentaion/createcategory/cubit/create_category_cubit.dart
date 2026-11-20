import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revana_app/feature/categories/presentaion/createcategory/state/create_category_state.dart';

import '../../../domain/usecase/create_category_use_case.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  final CreateCategoryUseCase createCategoryUseCase;

  CreateCategoryCubit({required this.createCategoryUseCase})
    : super(CreateCategoryInitialState());

  Future<void> createCategory({required String name}) async {
    emit(CreateCategoryLoadingState());
    try {
      final result = await createCategoryUseCase.call(name);
      emit(CreateCategorySuccessState(category: result));
    } catch (error) {
      emit(CreateCategoryErrorState(message: error.toString()));
    }
  }
}
