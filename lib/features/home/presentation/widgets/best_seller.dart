import 'package:bookai_store/core/constants/app_design.dart';
import 'package:bookai_store/core/styles/app_colors.dart';
import 'package:bookai_store/core/styles/text_styles.dart';
import 'package:bookai_store/features/home/data/model/best_seller_book_respons/product.dart';
import 'package:bookai_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookai_store/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
              return BookCard(
                product: books[index],
              );
            },
          ),
        ],
      );
      },
      );
    }
  }

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDesign.BORDER_RADIUS),
        border: Border.all(color: LightPalette.borderColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: 'book-cover-${product.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: cardHeight * .6,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: cardHeight * .6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: LightPalette.borderColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          Expanded(
              child: Text(
                product.name ?? '',
                style: TextStyles.subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          Row(
              children: [
                Text(
                  '\$${product.priceAfterDiscount ?? product.price}',
                  style: TextStyles.subtitle,
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: LightPalette.primaryColor,
                  ),
                  child: const Icon(Icons.add, color: LightPalette.whiteColor),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
