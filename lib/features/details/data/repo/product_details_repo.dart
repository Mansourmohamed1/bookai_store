import 'package:bookai_store/core/services/dio/apis.dart';
import 'package:bookai_store/core/services/dio/dio_provider.dart';
import 'package:bookai_store/features/details/data/model/product_details_response.dart';

class ProductDetailsRepo {

  static Future<ProductDetailsResponse?> getProductDetails(int productId) async {
    try {
      var  response =await DioProvider.getApi(endpoint: Apis.productDetails(productId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProductDetailsResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}