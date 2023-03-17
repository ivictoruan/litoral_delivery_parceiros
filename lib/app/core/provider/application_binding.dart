import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/address_model.dart';
import '../../models/organization_model.dart';
import '../../pages/auth/login/controller/login_controller.dart';
import '../../pages/auth/register/controller/register_controller.dart';
import '../../pages/product_registration/controller/product_registration_controller_impl.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';
import '../rest_client/custom_dio.dart';

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => OrganizationModel(address: AddressModel()),
        ),
        Provider(
          create: (context) => CustomDio(),
        ),
        Provider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            dio: context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterController(
            context.read<AuthRepository>(),
            organizationModel: OrganizationModel(address: AddressModel()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(
              // context.read<AuthRepository>(),
              ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductRegistrationControllerImpl(
              // context.read<AuthRepository>(),
              ),
        ),
      ],
      child: child,
    );
  }
}
