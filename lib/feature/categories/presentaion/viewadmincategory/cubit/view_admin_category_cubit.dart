import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/view_admin_categories_use_case.dart';
import '../state/view_admin_category_state.dart';

class ViewAdminCategoryCubit extends Cubit<ViewAdminCategoryState> {
  final ViewAdminCategoriesUseCase viewAdminCategoriesUseCase;

  ViewAdminCategoryCubit({required this.viewAdminCategoriesUseCase})
    : super(ViewAdminCategoryInitialState());

  Future<void> viewAdminCategories() async {
    emit(ViewAdminCategoryLoadingState());
    try {
      final result = await viewAdminCategoriesUseCase.call();
      emit(ViewAdminCategoryLoadedState(categories: result));
    } catch (error) {
      emit(ViewAdminCategoryErrorState(message: error.toString()));
    }
  }
}
