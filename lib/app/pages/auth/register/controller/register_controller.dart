import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../models/address_model.dart';
import '../../../../models/organization_model.dart';
import '../../../../repositories/auth/auth_repository.dart';

class RegisterController extends ChangeNotifier {
  final OrganizationModel organizationModel;
  final AuthRepository _authRepository;

  // Mensagem de erro para o dia da semana
  String errorOpeningDays = '';

  RegisterController(
    this._authRepository, {
    required this.organizationModel,
  });

  Future<void> registerOrganization() async {
    try {
      await _authRepository.registerOrganization(organizationModel);
    } catch (e, s) {
      log("Erro ao registrar usuário", error: e, stackTrace: s);
    }
  }

  set organizationEmail(String newEmail) {
    organizationModel.email = newEmail;
    notifyListeners();
  }

  set organizationName(String newName) {
    organizationModel.name = newName;
    notifyListeners();
  }

  set organizationCategory(OrganizationCategory newCategory) {
    organizationModel.category = newCategory;
    notifyListeners();
  }

  set organizationResponsibleName(String newOrganizationResponsibleName) {
    organizationModel.responsibleName = newOrganizationResponsibleName;
    notifyListeners();
  }

  set organizationAddress(AddressModel newAddress) {
    organizationModel.address = newAddress;
    notifyListeners();
  }

  set organizationContactNumber(String newContactNumber) {
    organizationModel.contactNumber = newContactNumber;
    notifyListeners();
  }

  set organizationStreet(String newStreet) {
    organizationModel.address.street = newStreet;
    notifyListeners();
  }

  set organizationNeightborhood(String newNeightborhood) {
    organizationModel.address.neightborhood = newNeightborhood;
    notifyListeners();
  }

  set organizationCity(City newCity) {
    organizationModel.address.city = newCity;
    notifyListeners();
  }

  set organizationNumber(String newNumber) {
    organizationModel.address.number = newNumber;
    notifyListeners();
  }

  set organizationComplement(String newComplement) {
    organizationModel.address.complemet = newComplement;
    notifyListeners();
  }

  set organizationDescription(String newDescription) {
    organizationModel.description = newDescription;
    notifyListeners();
  }

  set organizationOpeningTime(String newOpeningTime) {
    organizationModel.openingTime = newOpeningTime;
    notifyListeners();
  }

  set organizationClosingTime(String newClosingTime) {
    organizationModel.closingTime = newClosingTime;
    notifyListeners();
  }

  set organizationOpeningDays(List<String> newOpeningDays) {
    organizationModel.openingDays = newOpeningDays;
    notifyListeners();
  }

set organizationPassword(String newPassword) {
    organizationModel.password = newPassword;
    notifyListeners();
  }
  String get organizationEmail => organizationModel.email;

  String get organizationName => organizationModel.name;

  String get organizationContactNumber => organizationModel.contactNumber;

  String get organizationStreet => organizationModel.address.street;

  String get organizationResponsibleName => organizationModel.responsibleName;

  OrganizationCategory get organizationCategory => organizationModel.category;

  String get organizationNeightborhood =>
      organizationModel.address.neightborhood;

  City get organizationCity => organizationModel.address.city;

  String get organizationNumber => organizationModel.address.number;

  String get organizationComplement => organizationModel.address.complemet;

  String get organizationDescription => organizationModel.description;

  List<String> get organizationOpeningDays => organizationModel.openingDays;

  String get organizationOpeningTime => organizationModel.openingTime;

  String get organizationClosingTime => organizationModel.closingTime;

  String get organizationPassword => organizationModel.password;
}
