import 'package:bookai_store/core/constants/app_design.dart';
import 'package:bookai_store/core/constants/app_images.dart';
import 'package:bookai_store/core/styles/app_colors.dart';
import 'package:bookai_store/core/styles/text_styles.dart';
import 'package:bookai_store/core/widgets/custom_svg_image.dart';
import 'package:bookai_store/core/widgets/main_app_bar.dart';
import 'package:bookai_store/core/widgets/main_button.dart';
import 'package:bookai_store/features/details/presentation/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        actions: [
          IconButton(
            icon: const CustomSvgImage(path: AppImages.bookmarkSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading || state is ProductDetailsError) {
            return const Center(child: CircularProgressIndicator());
          }
          final product = context.read<ProductDetailsCubit>().product;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      product!.image ?? '',
                      width: 200,
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(product.name ?? '', style: TextStyles.title1),
                  Text(
                    product.category ?? '',
                    style: TextStyles.body.copyWith(
                      color: LightPalette.primaryColor,
                    ),
                  ),
                  Text(
                    product.description ?? '',
                    style: TextStyles.body,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDesign.CONTENT_PADDING),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$148', style: TextStyles.title1),
              MainButton(width: 180, onPressed: () {}, text: 'Add to Cart'),
            ],
          ),
        ),
      ),
    );
  }
}
