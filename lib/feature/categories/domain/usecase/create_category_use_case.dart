import '../entity/category_entity.dart';
import '../repository/categories_repository.dart';

class CreateCategoryUseCase {
  final CategoriesRepository categoriesRepository;

  CreateCategoryUseCase({required this.categoriesRepository});

  Future<CategoryEntity> call(String name) {
    return categoriesRepository.createCategory(name);
  }
}
