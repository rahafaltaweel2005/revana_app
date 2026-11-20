class ApiConst {
  static const String baseUrl = 'http://localhost:5102';

  static const String register = "/api/auth/register";
  static const String login = "/api/auth/login";
  static const String profile = "/api/auth/me";

  static const String viewAdminCategories = "/api/admin/categories";
  static const String createCategory = "/api/admin/categories";
  static String updateCategoryById(String id) => "/api/admin/categories/$id";
  static String deleteCategoryById(String id) => "/api/admin/categories/$id";

  static const String viewCategories = "/api/categories";

  static const String viewAdminBrands = "/api/admin/brands";
  static const String createBrand = "/api/admin/brands";
  static String getBrandById(String id) => "/api/admin/brands/$id";
  static String updateBrandById(String id) => "/api/admin/brands/$id";
  static String deleteBrandById(String id) => "/api/admin/brands/$id";

  static const String viewBrands = "/api/brands";
}
