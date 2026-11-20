import 'package:revana_app/feature/categories/domain/entity/category_entity.dart';

import '../../domain/repository/categories_repository.dart';
import '../datasource/categories_remote_datasource.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesRemoteDatasource categoriesremoteDatasource;

  CategoriesRepositoryImpl({required this.categoriesremoteDatasource});

  @override
  Future<CategoryEntity> createCategory(String name) async {
    final result = await categoriesremoteDatasource.createCategory(name);
    return result.toEntity();
  }

  @override
  Future<void> deleteCategoryById(String id) async {
    await categoriesremoteDatasource.deleteCategoryById(id);
  }

  @override
  Future<CategoryEntity> updateCategoryById(String id, String name) async {
    final result = await categoriesremoteDatasource.updateCategoryById(
      id,
      name,
    );
    return result.toEntity();
  }

  @override
  Future<List<CategoryEntity>> viewAdminCategories() async {
    final result = await categoriesremoteDatasource.viewAdminCategories();
    return result.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<CategoryEntity>> viewCategories() async {
    final result = await categoriesremoteDatasource.viewCategories();
    return result.map((e) => e.toEntity()).toList();
  }
}
