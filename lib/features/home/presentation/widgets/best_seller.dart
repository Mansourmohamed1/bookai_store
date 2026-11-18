import 'package:bookai_store/core/constants/app_design.dart';
import 'package:bookai_store/core/routes/naviagtions.dart';
import 'package:bookai_store/core/styles/app_colors.dart';
import 'package:bookai_store/core/styles/text_styles.dart';
import 'package:bookai_store/features/details/presentation/pages/product_details_screen.dart';
import 'package:bookai_store/features/home/data/model/best_seller_book_respons/product.dart';
import 'package:bookai_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookai_store/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'book_card.dart';

const cardHeight = 320.0;

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadingState || state is HomeErrorState) {
          return const CircularProgressIndicator();
        }
        var books = context.read<HomeCubit>().bestSellerData;
        if (books.isEmpty) {
          return const SizedBox();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Best Seller', style: TextStyles.title1),
            const Gap(8),
            GridView.builder(
              shrinkWrap: true,
              itemCount: books.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 280,
              ),
              itemBuilder: (context, index) {
                return BookCard(product: books[index]);
              },
            ),
          ],
        );
      },
    );
  }
}
