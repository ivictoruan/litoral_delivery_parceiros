import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class RealInputFormatter extends TextInputFormatter {
  RealInputFormatter({this.centavos = false});

  final bool centavos;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove qualquer caractere que não seja dígito
    final cleanedValue = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    final intValue = int.parse(cleanedValue);

    // Divide o valor por 100 para remover os centavos
    final doubleValue = intValue / 100.0;

    // Formata o valor em Real
    final formattedValue = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: centavos ? 2 : 0,
    ).format(doubleValue);

    // Retorna o novo valor formatado
    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}
