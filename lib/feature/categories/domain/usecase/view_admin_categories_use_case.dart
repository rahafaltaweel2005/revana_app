import 'package:revana_app/feature/categories/domain/repository/categories_repository.dart';

import '../entity/category_entity.dart';

class ViewAdminCategoriesUseCase {
  final CategoriesRepository categoriesRepository;

  ViewAdminCategoriesUseCase({required this.categoriesRepository});

  Future<List<CategoryEntity>> call() {
    return categoriesRepository.viewAdminCategories();
  }
}