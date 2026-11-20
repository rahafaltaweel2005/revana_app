import 'package:revana_app/feature/categories/domain/entity/category_entity.dart';

abstract class CategoriesRepository {
  Future<List<CategoryEntity>> viewAdminCategories();

  Future<CategoryEntity> createCategory(String name);

  Future<CategoryEntity> updateCategoryById(String id, String name);

  Future<void> deleteCategoryById(String id);

  Future<List<CategoryEntity>> viewCategories();
}
