import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:litoral_delivery_parceiros/app/models/organization_model.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unAuth().post(
        "/auth",
        data: {
          "email": email,
          "password": password,
        },
      );
      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      const String message = "Erro ao fazer login";

      if (e.response?.statusCode == 403) {
        log("Permissão negada!", error: e, stackTrace: s);
        throw UnauthorizedException();
      }

      log(message, error: e, stackTrace: s);
      throw RepositoryException(message: message);
    }
  }

  @override
  Future<void> register(String name, String email, password) async {
    try {
      await dio.unAuth().post(
        '/users',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
    } on DioError catch (e, s) {
      const String message = "Erro ao registrar usuário";

      log(message, error: e, stackTrace: s);
      throw RepositoryException(message: message);
    }
  }

  @override
  Future<void> registerOrganization(OrganizationModel organization) async {
    try {
      await dio.unAuth().post(
        '/organization',
        data: {
          'email': organization.email,
          'name': organization.name,
          'contactNumber': organization.contactNumber,
          'responsibleName': organization.responsibleName,
          // 'products': organization.products,
          'address': organization.address,
          'category': organization.category,
          'description': organization.description,
          'openingDays': organization.openingDays,
          'openingTime': organization.openingTime,
          'closingTime': organization.closingTime,
        },
      );
    } on DioError catch (e, s) {
      const String message = "Erro ao registrar empresa";

      log(message, error: e, stackTrace: s);
      throw RepositoryException(message: message);
    }
  }
}
