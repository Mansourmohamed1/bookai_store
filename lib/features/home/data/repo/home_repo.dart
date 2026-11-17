import 'package:bookai_store/core/services/dio/apis.dart';
import 'package:bookai_store/core/services/dio/dio_provider.dart';
import 'package:bookai_store/features/home/data/model/best_seller_book_respons/best_seller_book_respons.dart';
import 'package:bookai_store/features/home/data/model/slider_respons/slider_respons.dart';

class HomeRepo {
  static Future<SliderRespons?> getSlider() async {
    try {
      var response = await DioProvider.getApi(endpoint: Apis.sliders);
      if (response.statusCode == 200) {
        return SliderRespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }

  static Future<BestSellerBookRespons?> getBestSeller() async {
    try {
      var response = await DioProvider.getApi(endpoint: Apis.bestSellerBooks);
      if (response.statusCode == 200) {
        return BestSellerBookRespons.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
}
