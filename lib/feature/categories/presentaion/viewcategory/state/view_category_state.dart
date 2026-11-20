import '../../../domain/entity/category_entity.dart';

abstract class ViewCategoryState {}

class ViewCategoryInitialState extends ViewCategoryState {}

class ViewCategoryLoadingState extends ViewCategoryState {}

class ViewCategoryLoadedState extends ViewCategoryState {
  final List<CategoryEntity> categories;

  ViewCategoryLoadedState({required this.categories});
}

class ViewCategoryErrorState extends ViewCategoryState {
  final String message;

  ViewCategoryErrorState({required this.message});
}
