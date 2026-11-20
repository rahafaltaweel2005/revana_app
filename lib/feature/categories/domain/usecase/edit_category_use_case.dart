import '../entity/category_entity.dart';
import '../repository/categories_repository.dart';

class EditCategoryUseCase {
  final CategoriesRepository categoriesRepository;

  EditCategoryUseCase({required this.categoriesRepository});

  Future<CategoryEntity> call(String id, String name) {
    return categoriesRepository.updateCategoryById(id, name);
  }
}
