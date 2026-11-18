import 'package:bookai_store/core/routes/routes.dart';
import 'package:bookai_store/core/services/dio/dio_provider.dart';
import 'package:bookai_store/core/services/local/shared_pref.dart';
import 'package:bookai_store/core/styles/themes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  DioProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BookaiStore(),
    );
  }
}

class BookaiStore extends StatelessWidget {
  const BookaiStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.router,
      title: 'Bookia',
      theme: AppThemes.lightTheme,
    );
  }
}
