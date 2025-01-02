import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final String baseUrl = '${dotenv.env['BASE_URL']}';
  final String mainUrl = '${dotenv.env['MAIN_URL']}';
  final String registerUrl = "/auth/register";
  final String loginUrl = "/auth/login";
  final String logoutUrl = "/auth/logout";
  final String profileUrl = "/auth/profile";
  final String homeUrl = "/todos";
}

class ApiKey {
  String id = "id";
  String limit = "limit";
  String isActive = "isActive";
  String discountType = "discountType";
  String code =  "code";
  String discount= "discount";
  String maxUses = "maxUses";
  String createdBy = "createdBy";
  String createdAt = "createdAt";
  String updatedAt = "updatedAt";
  String expiryDate = "expiryDate";
  String page = "page";
  String status = "status";
  String driver = "driver";
  String name = "name";
  String isColor = "isColor";
  String categoryId = "categoryId";
  String subCategoryId = "subCategoryId";
  String color = "color";
  String product = "product";
  String size = "size";
  String images = "images";
  String image = "image";
  String brandId = "brandId";
  String offerPrice = "offerPrice";
  String price = "price";
  String content = "content";
  String quantity = "quantity";
  String total = "total";
  String user = "user";
  String userId = "userId";
  String variantId = "variantId";
  String username = "username";
  String email = "email";
  String address = "address";
  String street = "street";
  String suite = "suite";
  String city = "city";
  String zipcode = "zipcode";
  String lat = "lat";
  String lng = "lng";
  String phone = "phone";
  String country = "country";
  String zip = "zip";
  String payments = "payments";
  String maps = "maps";
  String password = "password";
}
