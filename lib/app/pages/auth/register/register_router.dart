import 'package:litoral_delivery_parceiros/app/models/organization_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/register_controller.dart';
import 'organization_form.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => RegisterController(
              organizationModel: context.read<OrganizationModel>(),
            ),
          ),
        ],
        child: const OrganizationForm(),
      );
}
