import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'register_page.dart';


class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers:  [
          // ChangeNotifierProvider(
          //   create: (context) => RegisterController(
          //     context.read<AuthRepository>(),
          //     organizationModel: context.read<OrganizationModel>(),
          //   ),
          // ),
          Provider(
            create: (context) => Object(),
          ),
        ],
        child: const RegisterPage(),
      );
}
