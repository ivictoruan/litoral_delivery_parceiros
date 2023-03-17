import 'dart:convert';

import 'package:litoral_delivery_parceiros/app/core/extentions/city_extention.dart';

enum City {
  apicumAcu,
  bacuri,
  cedral,
  centralDoMaranhao,
  cururupu,
  guimaraes,
  mirinzal,
  portoRicoDoMaranhao,
}

class AddressModel {
  String street;
  String number;
  City city;
  String neightborhood;
  String complemet;
  AddressModel({
    this.street = '',
    this.number = '',
    this.city = City.cururupu,
    this.neightborhood = '',
    this.complemet = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'number': number,
      'city': city.toMap(),
      'neightborhood': neightborhood,
      'complemet': complemet,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AddressModel(street: $street, number: $number, city: $city, neightborhood: $neightborhood, complemet: $complemet)';
  }
}
