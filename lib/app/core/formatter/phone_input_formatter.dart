import 'package:flutter/services.dart';

// class PhoneInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     var cleanText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
//     String formattedText;

//     if (cleanText.isEmpty) {
//       formattedText = '';
//     } else if (cleanText.length < 3) {
//       formattedText = '($cleanText';
//     } else if (cleanText.length < 6) {
//       formattedText =
//           '(${cleanText.substring(0, 2)}) ${cleanText.substring(2)}';
//     } else if (cleanText.length < 11) {
//       formattedText =
//           '(${cleanText.substring(0, 2)}) ${cleanText.substring(2, 5)}-${cleanText.substring(5)}';
//     } else {
//       formattedText =
//           '(${cleanText.substring(0, 2)}) ${cleanText.substring(2, 6)}-${cleanText.substring(6, 11)}';
//     }

//     return TextEditingValue(
//       text: formattedText,
//       selection: TextSelection.collapsed(offset: formattedText.length),
//     );
//   }
// }

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var cleanText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    String formattedText;

    if (cleanText.length > 11) {
      return oldValue;
    }

    if (cleanText.isEmpty) {
      formattedText = '';
    } else if (cleanText.length < 3) {
      formattedText = '($cleanText';
    } else if (cleanText.length < 5) {
      formattedText =
          '(${cleanText.substring(0, 2)}) ${cleanText.substring(2)}';
    } else if (cleanText.length < 10) {
      formattedText =
          '(${cleanText.substring(0, 2)}) ${cleanText.substring(2, 3)}-${cleanText.substring(3)}';
    } else {
      formattedText =
          '(${cleanText.substring(0, 2)}) ${cleanText.substring(2, 3)}-${cleanText.substring(3, 7)} ${cleanText.substring(7)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
