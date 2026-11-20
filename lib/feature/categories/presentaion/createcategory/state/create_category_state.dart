import '../../../domain/entity/category_entity.dart';

abstract class CreateCategoryState {}

class CreateCategoryInitialState extends CreateCategoryState {}

class CreateCategoryLoadingState extends CreateCategoryState {}

class CreateCategorySuccessState extends CreateCategoryState {
  final CategoryEntity category;

  CreateCategorySuccessState({required this.category});
}

class CreateCategoryErrorState extends CreateCategoryState {
  final String message;

  CreateCategoryErrorState({required this.message});
}
