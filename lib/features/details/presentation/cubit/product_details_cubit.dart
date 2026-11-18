import 'package:bloc/bloc.dart';
import 'package:bookai_store/features/details/data/repo/product_details_repo.dart';
import 'package:bookai_store/features/home/data/model/best_seller_book_respons/product.dart';


part 'product_details_state.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  Product? product;
  Future<void> getProductDetails(int productId) async {
    emit(ProductDetailsLoading());
    try {
      var response = await ProductDetailsRepo.getProductDetails(productId);
      if (response?.data != null) {
        product = response?.data;
        emit(ProductDetailsSuccess());
      } else {
        emit(ProductDetailsError("Failed to fetch product details"));
      }
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }
}
