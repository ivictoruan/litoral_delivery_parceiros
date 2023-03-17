import '../../models/address_model.dart';

extension CityExtension on City {
  String get cityName {
    switch (this) {
      case City.apicumAcu:
        return "Apicum-Açu";
      case City.bacuri:
        return "Bacuri";
      case City.cedral:
        return "Cedral";
      case City.centralDoMaranhao:
        return "Central do Maranhão";
      case City.cururupu:
        return "Cururupu";
      case City.guimaraes:
        return "Guimarães";
      case City.mirinzal:
        return "Mirinzal";
      case City.portoRicoDoMaranhao:
        return "Porto Rico do Maranhão";
      default:
        return "";
    }
  }

  Map<String, dynamic> toMap() {
    return {'name': toString().split('.').last};
  }
}
