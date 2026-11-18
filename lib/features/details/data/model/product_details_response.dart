import 'package:bookai_store/features/home/data/model/best_seller_book_respons/product.dart';

class ProductDetailsResponse {
  Product? data;
  String? message;
  int? status;

  ProductDetailsResponse({this.data, this.message, this.status});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      data: json['data'] == null
          ? null
          : Product.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      status: json['status'] as int?,
    );
  }
}
