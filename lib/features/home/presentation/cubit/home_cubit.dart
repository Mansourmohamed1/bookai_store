import 'package:bookai_store/features/home/data/model/best_seller_book_respons/best_seller_book_respons.dart';
import 'package:bookai_store/features/home/data/model/best_seller_book_respons/product.dart';
import 'package:bookai_store/features/home/data/model/slider_respons/slider.dart';
import 'package:bookai_store/features/home/data/model/slider_respons/slider_respons.dart';
import 'package:bookai_store/features/home/data/repo/home_repo.dart';
import 'package:bookai_store/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
  List<SliderModel> sliderData = [];
  List<Product> bestSellerData = [];

  Future<void> getHomeData() async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    var futures = await Future.wait([
      HomeRepo.getSlider(),
      HomeRepo.getBestSeller(),
    ]);
    var slidersRes = futures[0] as SliderRespons?;
    var bestSellerBooksRes = futures[1] as BestSellerBookRespons?;
    if (slidersRes != null || bestSellerBooksRes != null) {
      sliderData = slidersRes?.data?.sliders ?? [];
      bestSellerData = bestSellerBooksRes?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState("No data found"));
    }
  }
}
