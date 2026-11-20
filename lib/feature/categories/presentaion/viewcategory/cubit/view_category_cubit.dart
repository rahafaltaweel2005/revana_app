import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/view_categories_use_case.dart';
import '../state/view_category_state.dart';

class ViewCategoryCubit extends Cubit<ViewCategoryState> {
  final ViewCategoriesUseCase viewCategoriesUseCase;

  ViewCategoryCubit({required this.viewCategoriesUseCase})
    : super(ViewCategoryInitialState());

  Future<void> viewCategories() async {
    emit(ViewCategoryLoadingState());
    try {
    final result = await  viewCategoriesUseCase.call();
    emit(ViewCategoryLoadedState(categories: result));
    } catch (error) {
      emit(ViewCategoryErrorState(message: error.toString()));
    }
  }
}
