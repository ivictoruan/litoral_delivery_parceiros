import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomWillPopScope extends StatelessWidget {
  final Widget child;

  const CustomWillPopScope({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Center(
                child: Text(
                  'Voltar para o início?',
                  style: context.textStyles.textTitle.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Sim'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('Não'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: child,
    );
  }
}
