import 'package:revana_app/feature/categories/data/model/category_model.dart';

import '../../../../core/constant/api_const.dart';
import '../../../../core/network/api_client.dart';
import 'categories_remote_datasource.dart';

class CategoriesRemoteDatasourceImpl extends CategoriesRemoteDatasource {

  @override
  Future<CategoryModel> createCategory(String name) async {
    final response = await ApiClient.post(
      endpoint: ApiConst.createCategory,
      data: {'name': name},
    );
    return CategoryModel.fromJson(response.data);
  }

  @override
  Future<void> deleteCategoryById(String id) async {
    await ApiClient.delete(endpoint: ApiConst.deleteCategoryById(id));
  }

  @override
  Future<CategoryModel> updateCategoryById(String id, String name) async {
    final response = await ApiClient.put(
      endpoint: ApiConst.updateCategoryById(id),
      data: {'name': name},
    );

    return CategoryModel.fromJson(response.data);
  }

  @override
  Future<List<CategoryModel>> viewAdminCategories() async {
    final response = await ApiClient.get(
      endpoint: ApiConst.viewAdminCategories,
    );
    return (response.data as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<CategoryModel>> viewCategories() async {
    final response = await ApiClient.get(endpoint: ApiConst.viewCategories);
    return (response.data as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
  }
}
