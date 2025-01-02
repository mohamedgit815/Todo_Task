import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  final String mainUrl = '${dotenv.env['MAIN_URL']}';
  final String baseUrl = '${dotenv.env['BASE_URL']}';
  final String registerUrl = "/auth/Register";
  final String loginUrl = "/auth";
  final String postersUrl = "/posters";
  final String productUrl = "/products";
  final String orderUrl = "/orders";
  final String categoryUrl = "/category";
  final String brandUrl = "/brand";
  final String cartUrl = "/carts";
  final String subCategoryUrl = "/subcategory";
  final String updateProfileUrl = "/auth/";
  final String allProductUrl = "/product";
  final String productExistUrl= "/product/exist";
  final String productAndCategory = "/product/category";
  final String getAllCategory = "/category/all/";
  final String searchProduct = "/product/search";
  final String addToCart = "/cart";
  final String countAndTotal = "/cart/count";
  final String cartAndAll = "/cart/all";
  final String order = "/order";
  final String adminOrder = "/order/other";

  final String icon = 'assets/images/icon.png';

  /// Add Here Name Languages
  final String arabic = 'عربي';
  final String english = "English";


  /// SnackBar
  final String createScreenSuccess = 'Created';
  final String createScreenError = 'is Empty';
  final String homeScreenDeleted = 'Item is Deleted';
  final String updateSuccess = "Item Updated";
  final String updateError = "Error";


  /// Alert Dialog
  final String saveDialog = "Do you want to Save ?";
  final String deleteDialog = "You will delete Item ?";
  final String sureDialog = "Are you sure ?";


  /// AppBar Text
  final String appbarHomeScreen = "Home Screen";
  final String appbarCreateScreen = "Create Screen";
  final String appbarUpdateScreen = "Update Screen";
}