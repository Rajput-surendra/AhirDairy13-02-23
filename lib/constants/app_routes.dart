import 'package:get/get.dart';
import 'package:milk/ui/dashboard/dashboard.dart';
import 'package:milk/ui/login/login.dart';
import 'package:milk/ui/product/product.dart';
import 'package:milk/ui/ui.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/', page: () => SplashUI()),
    GetPage(name: '/loginDashboard', page: () => LoginDashboard()),
    GetPage(name: '/signUpScreen', page: () => SignUpScreen()),
    GetPage(name: '/signInScreen', page: () => SignInScreen()),
    GetPage(name: '/verificationScreen', page: () => VerificationScreen()),
    GetPage(name: '/dashBoardScreen', page: () => DashBoardScreen()),
    GetPage(
        name: '/homeScreen',
        page: () => HomeScreen(
              callback: (int) {},
            )),
    GetPage(name: '/searchForProduct', page: () => SearchForProduct()),
    GetPage(
        name: '/productSearchedScreen', page: () => ProductSearchedScreen()),
    GetPage(name: '/productDetailScreen', page: () => ProductDetailScreen()),
    GetPage(name: '/checkoutScreen', page: () => CheckoutScreen()),
  ];
}
