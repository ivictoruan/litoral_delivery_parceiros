import 'package:flutter/material.dart';

import 'core/provider/application_binding.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_router.dart';
import 'pages/auth/register/organization_form.dart';
import 'pages/splash/splash_page.dart';

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
          '/auth/register': (context) => const OrganizationForm(),
          // '/home': (context) => HomeRouter.page,
          // '/productDetail': (context) => ProductDetailRouter.page,
          // '/order': (context) => OrderRouter.page,
          // '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
