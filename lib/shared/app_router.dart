import 'package:go_router/go_router.dart';
import 'package:yumzy/features/auth/screen/login_screen.dart';
import 'package:yumzy/features/cart/screen/cart_screen.dart';
import 'package:yumzy/main_root_screen.dart';
import 'package:yumzy/shared/shared_screen/splash_screen.dart';
import '../features/auth/screen/singup_screen.dart';
import '../features/orderHistory/screen/orders_details_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),

    GoRoute(path: '/MainRootScreen' ,
    builder: (context, state) => MainRootScreen(),
    ),
    GoRoute(path: '/SignUpScreen', builder: (context, state) => SignUpScreen()),

    GoRoute(path: '/LogInScreen', builder: (context, state) => LogInScreen()),

   GoRoute(path: '/CartScreen', builder: (context, state) => CartScreen()),
   GoRoute(path: '/OrdersDetailsScreen', builder: (context, state) => OrdersDetailsScreen()),


  ],
);
