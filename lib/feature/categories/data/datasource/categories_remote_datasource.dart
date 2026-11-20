import 'package:revana_app/feature/categories/data/model/category_model.dart';

abstract class CategoriesRemoteDatasource {
  Future<List<CategoryModel>> viewAdminCategories();

  Future<CategoryModel> createCategory(String name);

  Future<CategoryModel> updateCategoryById(String id, String name);

  Future<void> deleteCategoryById(String id);

  Future<List<CategoryModel>> viewCategories();
}
