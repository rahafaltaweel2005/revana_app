import 'package:revana_app/feature/categories/domain/repository/categories_repository.dart';

class DeleteCategoryUseCase {
  final CategoriesRepository categoriesRepository;

  DeleteCategoryUseCase({required this.categoriesRepository});

  Future<void> call(String id) {
    return categoriesRepository.deleteCategoryById(id);
  }
}
