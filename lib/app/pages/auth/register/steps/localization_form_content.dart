import 'package:litoral_delivery_parceiros/app/core/extentions/city_extention.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../models/address_model.dart';
import '../controller/register_controller.dart';

class LocalizationFormContent extends StatefulWidget {
  final GlobalKey<FormState> formKeyAddress;

  const LocalizationFormContent({super.key, required this.formKeyAddress});

  @override
  State<LocalizationFormContent> createState() =>
      _LocalizationFormContentState();
}

class _LocalizationFormContentState extends State<LocalizationFormContent> {
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _numberAddressController =
      TextEditingController();
  // final TextEditingController _cityController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();

  final GlobalKey<FormFieldState<String>> _cityFormFieldKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyAddress,
      child: Consumer<RegisterController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: _streetController,
                validator: Validatorless.required('Rua é obrigatório!'),
                decoration: const InputDecoration(
                  labelText: 'Rua',
                ),
                onChanged: (text) {
                  controller.organizationStreet = _streetController.text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _neighborhoodController,
                validator: Validatorless.required('Bairro é obrigatório!'),
                decoration: const InputDecoration(
                  labelText: 'Bairro',
                ),
                onChanged: (text) {
                  controller.organizationNeightborhood =
                      _neighborhoodController.text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: _cityFormFieldKey,
                readOnly: true,
                onTap: () => _showDialogSelectCity(context),
                decoration: const InputDecoration(
                  labelText: 'Cidade',
                  hintText: 'Selecione uma Cidade',
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Selecione uma Cidade';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _numberAddressController,
                validator: Validatorless.required('Número é obrigatório!'),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Número',
                ),
                onChanged: (text) {
                  controller.organizationNumber = _numberAddressController.text;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _complementController,
                decoration: const InputDecoration(
                  labelText: 'Complemento',
                ),
                onChanged: (text) => controller.organizationComplement =
                    _complementController.text,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showDialogSelectCity(BuildContext context) async {
    final selectedCity = await showDialog<City>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(
            'Selecione uma cidade',
            textAlign: TextAlign.center,
          ),
          children: City.values
              .map(
                (city) => SimpleDialogOption(
                  onPressed: () {
                    final controller =
                        Provider.of<RegisterController>(context, listen: false);

                    Navigator.pop(context, city);

                    controller.organizationCity = city;
                  },
                  child: Column(
                    children: [
                      Text(city.cityName),
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
    City _selectedCity = City.cururupu;

    if (selectedCity != null) {
      setState(() {
        _selectedCity = selectedCity;
        _cityFormFieldKey.currentState!.didChange(selectedCity.cityName);
      });
    }
  }
}
