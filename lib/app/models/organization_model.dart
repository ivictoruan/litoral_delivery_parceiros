// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'address_model.dart';
import 'product_model.dart';

enum OrganizationCategory {
  distribuidora,
  lanchonete,
  restaurante,
  bar,
  supermercado,
  loja,
  farmacia,
  vestuario,
  outro,
}

class OrganizationModel extends ChangeNotifier {
  String email;
  String name;
  String contactNumber;
  String responsibleName;
  List<ProductModel> products;
  AddressModel address;
  OrganizationCategory category;
  String description;
  List<String> openingDays;
  String openingTime;
  String closingTime;
  String password;

  OrganizationModel({
    this.email = '',
    this.products = const [],
    this.contactNumber = '',
    this.name = '',
    this.responsibleName = '',
    required this.address,
    this.category =
        OrganizationCategory.outro, // e se for mais de uma categoria?
    this.description = '',
    this.openingTime = '',
    this.closingTime = '',
    this.openingDays = const [],
    this.password = '',
  });
  
  @override
  String toString() {
    return 'OrganizationModel(email: $email, name: $name, contactNumber: $contactNumber, responsibleName: $responsibleName, products: $products, address: $address, category: $category, description: $description, openingDays: $openingDays, openingTime: $openingTime, closingTime: $closingTime, password: $password)';
  }
}
