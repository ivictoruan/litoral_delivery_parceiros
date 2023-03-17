import 'package:flutter/material.dart';
import 'package:litoral_delivery_parceiros/app/pages/product_details/product_details_page.dart';

import 'core/provider/application_binding.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_router.dart';
import 'pages/auth/register/register_router.dart';
import 'pages/home/home_page.dart';
import 'pages/product_registration/product_registration_page.dart';
import 'pages/splash/splash_page.dart';
import 'pages/welcome/welcome_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Litoral Delivery - Parceiros",
        theme: ThemeConfig.theme.copyWith(
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRouter.page,
          '/welcome': (context) => const WelcomePage(),
          '/registerProduct': (context) => const ProductRegistrationPage(),
          '/home': (context) => const HomePage(),
          '/productDetails': (context) => const ProductDetailsPage(),
          // '/order': (context) => OrderRouter.page,
          // '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
