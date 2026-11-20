import 'package:revana_app/feature/categories/domain/repository/categories_repository.dart';

import '../entity/category_entity.dart';

class ViewCategoriesUseCase {
  final CategoriesRepository categoriesRepository;

  ViewCategoriesUseCase({required this.categoriesRepository});

  Future<List<CategoryEntity>> call() {
    return categoriesRepository.viewCategories();
  }
}