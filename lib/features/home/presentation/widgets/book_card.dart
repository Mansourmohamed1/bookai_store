import 'package:bookai_store/core/constants/app_design.dart';
import 'package:bookai_store/core/routes/naviagtions.dart';
import 'package:bookai_store/core/routes/route_names.dart';
import 'package:bookai_store/core/styles/app_colors.dart';
import 'package:bookai_store/core/styles/text_styles.dart';
import 'package:bookai_store/features/home/data/model/best_seller_book_respons/product.dart';
import 'package:bookai_store/features/home/presentation/widgets/best_seller.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (product.id != null) {
          pushTo(context, RouteNames.details, extra: product.id);
        }
        debugPrint('Book ID: ${product.id}');
      },
      child: Container(
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
      ),
    );
  }
}
