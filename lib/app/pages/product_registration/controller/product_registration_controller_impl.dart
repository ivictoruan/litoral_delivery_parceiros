import 'package:match/match.dart';

import 'product_registration_controller.dart';

part 'product_registration_controller_impl.g.dart';

@match
enum RegisterProductStatus {
  // mudar p/ produto
  initial,
  success,
  register,
  loading,
  registerError,
  error,
}

class ProductRegistrationControllerImpl extends ProductRegistrationController {
  RegisterProductStatus status = RegisterProductStatus.initial;
  @override
  void register(String image, String name, String price, String description) {
    status = RegisterProductStatus.success;
  }
}
