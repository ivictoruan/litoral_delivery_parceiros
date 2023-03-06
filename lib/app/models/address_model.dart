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
}
