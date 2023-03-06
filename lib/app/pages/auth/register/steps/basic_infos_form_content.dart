import 'package:litoral_delivery_parceiros/app/core/extentions/capitalize_extention.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/formatter/phone_input_formatter.dart';
import '../../../../models/organization_model.dart';
import '../controller/register_controller.dart';

class BasicInfosFormContent extends StatefulWidget {
  final GlobalKey<FormState> formKeyBasicInfos;
  const BasicInfosFormContent({super.key, required this.formKeyBasicInfos});

  @override
  State<BasicInfosFormContent> createState() => _BasicInfosFormContentState();
}

class _BasicInfosFormContentState extends State<BasicInfosFormContent> {
  final TextEditingController _emailEC = TextEditingController();
  final TextEditingController _organizationNameEC = TextEditingController();
  final GlobalKey<FormFieldState<String>> _categoryFormFieldKey =
      GlobalKey<FormFieldState<String>>();
  final TextEditingController _numberContactEC = TextEditingController();
  final TextEditingController _responsibleNameEC = TextEditingController();

  

  @override
  void dispose() {
    _emailEC.dispose();
    _organizationNameEC.dispose();
    _numberContactEC.dispose();
    _responsibleNameEC.dispose();
    super.dispose();
  }
  //  @override
  //  void didChangeDependencies() {
  //    super.didChangeDependencies();
  //   controller = Provider.of<RegisterController>(context);
     
  //  }

  // @override
  // void didUpdateWidget(oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   // ATUALIZA OS campos com valores dos controllers
  //   _emailEC.text = controller.organizationEmail;
  //   _organizationNameEC.text = controller.organizationName;
  //   _numberContactEC.text = controller.organizationNumber;
  //   _responsibleNameEC.text = controller.organizationResponsibleName;
  // }

  // função que pega valores dos controllers e coloca no controller principal!

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
      builder: (context, controller, child) {
        return Form(
          key: widget.formKeyBasicInfos,
          child: Column(
            children: [
              const SizedBox(height: 5),
              TextFormField(
                // initialValue: controller.organizationEmail.isEmpty
                //     ? ""
                //     : controller.organizationEmail,
                controller: _emailEC,
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: Validatorless.multiple(
                  [
                    Validatorless.required("E-mail obrigatório"),
                    Validatorless.email("E-mail inválido!"),
                  ],
                ),
                onChanged: (text) {
                  controller.organizationEmail = _emailEC.text;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _organizationNameEC,
                decoration: const InputDecoration(labelText: "Nome da Empresa"),
                validator:
                    Validatorless.required("Nome da Empresa obrigatório"),
                onChanged: (text) {
                  controller.organizationName = _organizationNameEC.text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _numberContactEC,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  PhoneInputFormatter(),
                ],
                decoration: const InputDecoration(
                  labelText: 'Número para Contato',
                ),
                validator: Validatorless.multiple(
                  [
                    Validatorless.required('Campo obrigatório'),
                    // Validatorless.min(
                    //   // 16 é a quantidade de dígitos que terá no formato (XX) X-XXXXXXXX
                    //   16,
                    //   'Número deve ter pelo menos 11 dígitos',
                    // ),
                  ],
                ),
                onChanged: (text) {
                  controller.organizationContactNumber = _numberContactEC.text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: _categoryFormFieldKey,
                readOnly: true,
                onTap: () {
                  _showDialogSelectCategory(context);
                },
                decoration: const InputDecoration(
                  labelText: 'Qual a categoria da sua Empresa?',
                  hintText: 'Selecione uma Categoria',
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Selecione uma Categoria';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _responsibleNameEC,
                decoration: const InputDecoration(
                    labelText: "Nome do responsável da Empresa"),
                validator: Validatorless.required(
                    "Nome do responsável da empresa obrigatório"),
                onChanged: (text) {
                  controller.organizationResponsibleName =
                      _responsibleNameEC.text;
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showDialogSelectCategory(BuildContext context) async {
    final selectedCategory = await showDialog<OrganizationCategory>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(
            'Selecione uma categoria',
            textAlign: TextAlign.center,
          ),
          children: OrganizationCategory.values
              .map(
                (category) => SimpleDialogOption(
                  onPressed: () {
                    final controller =
                        Provider.of<RegisterController>(context, listen: false);

                    Navigator.pop(context, category);

                    controller.organizationCategory = category;
                  },
                  child: Column(
                    children: [
                      Text(
                        category.toString().split('.').last.capitalize(),
                        style: context.textStyles.textMedium,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );

    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    OrganizationCategory _selectedCategory = OrganizationCategory.lanchonete;

    if (selectedCategory != null) {
      setState(() {
        _selectedCategory = selectedCategory;
        _categoryFormFieldKey.currentState!.didChange(
            selectedCategory.toString().split('.').last.capitalize());
      });
    }
  }
}
