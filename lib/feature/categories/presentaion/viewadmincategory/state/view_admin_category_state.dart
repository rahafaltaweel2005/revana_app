import '../../../domain/entity/category_entity.dart';

abstract class ViewAdminCategoryState {}

class ViewAdminCategoryInitialState extends ViewAdminCategoryState {}

class ViewAdminCategoryLoadingState extends ViewAdminCategoryState {}

class ViewAdminCategoryLoadedState extends ViewAdminCategoryState {
  final List<CategoryEntity> categories;

  ViewAdminCategoryLoadedState({required this.categories});
}

class ViewAdminCategoryErrorState extends ViewAdminCategoryState {
  final String message;

  ViewAdminCategoryErrorState({required this.message});
}
