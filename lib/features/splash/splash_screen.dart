import 'package:bookai_store/core/constants/app_images.dart';
import 'package:bookai_store/core/routes/naviagtions.dart';
import 'package:bookai_store/core/routes/route_names.dart';
import 'package:bookai_store/core/services/local/shared_pref.dart';
import 'package:bookai_store/core/styles/text_styles.dart';
import 'package:bookai_store/core/widgets/custom_svg_image.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var user = SharedPref.getUserData();
    Future.delayed(Duration(seconds: 3), () {
      if (user != null) {
        pushReplacement(context, RouteNames.main);
      } else {
        pushReplacement(context, RouteNames.welcome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgImage(path: AppImages.logoSvg, height: 80, width: 80),
            Text(
              'Order Your Books Now!',
              style: TextStyles.subtitle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
