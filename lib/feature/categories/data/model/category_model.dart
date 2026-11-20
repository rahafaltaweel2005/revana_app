import 'package:revana_app/feature/categories/domain/entity/category_entity.dart';

class CategoryModel {
  String? id;
  String? name;

  CategoryModel({this.id, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  CategoryEntity toEntity() {
    return CategoryEntity(id: id!, name: name!);
  }
}
