abstract class DeleteCategoryState {}

class DeleteCategoryInitialState extends DeleteCategoryState {}

class DeleteCategoryLoadingState extends DeleteCategoryState {}

class DeleteCategorySuccessState extends DeleteCategoryState {}

class DeleteCategoryErrorState extends DeleteCategoryState {
  final String message;

  DeleteCategoryErrorState({required this.message});
}
