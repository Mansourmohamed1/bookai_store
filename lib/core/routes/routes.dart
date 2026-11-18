import 'package:bookai_store/core/routes/route_names.dart';
import 'package:bookai_store/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookai_store/features/auth/presentation/pages/login_screen.dart';
import 'package:bookai_store/features/auth/presentation/pages/register_screen.dart';
import 'package:bookai_store/features/details/presentation/cubit/product_details_cubit.dart';
import 'package:bookai_store/features/details/presentation/pages/product_details_screen.dart';
import 'package:bookai_store/features/main/main_app_screen.dart';
import 'package:bookai_store/features/splash/splash_screen.dart';
import 'package:bookai_store/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.welcome,
        name: RouteNames.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.register,
        name: RouteNames.register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.main,
        name: RouteNames.main,
        builder: (context, state) => const MainAppScreen(),
      ),
       GoRoute(
        path: RouteNames.details,
        name: RouteNames.details,
        builder: (context, state) {
          var id = state.extra as int;
          return BlocProvider(
            create: (_) => ProductDetailsCubit()..getProductDetails(id),
            child: ProductDetailsScreen(productId: id),
          );
        },
      ),
    ],
  );
}
