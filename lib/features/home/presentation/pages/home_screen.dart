import 'package:bookai_store/core/constants/app_design.dart';
import 'package:bookai_store/core/constants/app_images.dart';
import 'package:bookai_store/core/widgets/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/best_seller.dart';
import '../widgets/home_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomSvgImage(path: AppImages.logoSvg, height: 32),
        actions: [
          IconButton(
            icon: CustomSvgImage(path: AppImages.searchSvg),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDesign.CONTENT_PADDING),
        child: SingleChildScrollView(
          child: Column(children: [HomeSlider(), const Gap(20), BestSeller()]),
        ),
      ),
    );
  }
}
