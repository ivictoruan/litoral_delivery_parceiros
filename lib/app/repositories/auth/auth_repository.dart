import '../../models/auth_model.dart';
import '../../models/organization_model.dart';

abstract class AuthRepository {
  Future<void> register(
    String name,
    String email,
    String password,
  );

  Future<void> registerOrganization(OrganizationModel organization);

  Future<AuthModel> login(String email, String password);
}
