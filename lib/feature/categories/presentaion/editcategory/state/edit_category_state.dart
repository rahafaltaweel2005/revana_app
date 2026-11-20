import '../../../domain/entity/category_entity.dart';

abstract class EditCategoryState {}

class EditCategoryInitialState extends EditCategoryState {}

class EditCategoryLoadingState extends EditCategoryState {}

class EditCategorySuccessState extends EditCategoryState {
  final CategoryEntity category;

  EditCategorySuccessState({required this.category});

}

class EditCategoryErrorState extends EditCategoryState {
  final String message;

  EditCategoryErrorState({required this.message});
}
