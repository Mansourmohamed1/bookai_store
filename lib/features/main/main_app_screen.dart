import 'package:bookai_store/core/constants/app_images.dart';
import 'package:bookai_store/core/styles/app_colors.dart';
import 'package:bookai_store/core/widgets/custom_svg_image.dart';
import 'package:bookai_store/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookai_store/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    BlocProvider(create: (context) => HomeCubit()..getHomeData(), child: HomeScreen()),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.homeSvg),
            activeIcon: CustomSvgImage(
              path: AppImages.homeSvg,
              color: LightPalette.primaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.bookmarkSvg),
            activeIcon: CustomSvgImage(
              path: AppImages.bookmarkSvg,
              color: LightPalette.primaryColor,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.categorySvg),
            activeIcon: CustomSvgImage(
              path: AppImages.categorySvg,
              color: LightPalette.primaryColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: CustomSvgImage(path: AppImages.profileSvg),
            activeIcon: CustomSvgImage(
              path: AppImages.profileSvg,
              color: LightPalette.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
