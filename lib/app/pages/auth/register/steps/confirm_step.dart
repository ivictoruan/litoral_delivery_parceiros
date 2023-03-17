import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../controller/register_controller.dart';
import '../widgets/confirm_infos_widget.dart';

class ConfirmStep extends StatefulWidget {
  final GlobalKey<FormState> formKeyConfirm;
  const ConfirmStep({super.key, required this.formKeyConfirm});

  @override
  State<ConfirmStep> createState() => _ConfirmStepState();
}

class _ConfirmStepState extends State<ConfirmStep> {
  final _passwordEC = TextEditingController();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyConfirm,
      child: Consumer<RegisterController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              const ConfirmInfosWidget(),
              const SizedBox(height: 20),
              const Divider(),
              Text(
                "Para finalizar, escolha uma senha para realizar seu login",
                style: context.textStyles.textMedium,
              ),
              const SizedBox(height: 10),
              StatefulBuilder(
                builder: (context, setState) => TextFormField(
                  obscureText: !_showPassword,
                  controller: _passwordEC,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword
                            ? Icons.lock_open_rounded
                            : Icons.lock_outlined,
                      ),
                    ),
                  ),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required("Senha obrigatória"),
                      Validatorless.min(
                          6, "Senha deve conter ao menos 6 caracteries!"),
                    ],
                  ),
                  // onChanged: (text) {},
                ),
              ),
              const SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setState) => TextFormField(
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: "Confirma senha",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword
                            ? Icons.lock_open_rounded
                            : Icons.lock_outlined,
                      ),
                    ),
                  ),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required("Confirma senha obrigatória"),
                      Validatorless.min(6,
                          "Confirma senha deve conter ao menos 6 caracteries!"),
                      Validatorless.compare(
                          _passwordEC, "As senhas estão diferentes!"),
                    ],
                  ),
                  onChanged: (text) =>
                      controller.organizationPassword = _passwordEC.text,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
