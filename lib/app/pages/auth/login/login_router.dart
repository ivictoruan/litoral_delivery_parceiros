import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => Object(
            ),
          ),
          
        ],
        child: const LoginPage(),
      );
}