import 'package:litoral_delivery_parceiros/app/core/ui/helpers/size_extentions.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../controller/register_controller.dart';

class AdditionalInfosFormContent extends StatefulWidget {
  final GlobalKey<FormState> formKeyAdditionalInfo;

  const AdditionalInfosFormContent(
      {super.key, required this.formKeyAdditionalInfo});

  @override
  State<AdditionalInfosFormContent> createState() =>
      _AdditionalInfosFormContentState();
}

class _AdditionalInfosFormContentState
    extends State<AdditionalInfosFormContent> {
  final _descriptionEC = TextEditingController();
  final GlobalKey<FormFieldState<String>> _openingTimeFormFieldKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<FormFieldState<String>> _closingTimeFormFieldKey =
      GlobalKey<FormFieldState<String>>();

  final List<String> _weekDays = [
    'Segunda',
    'Terça',
    'Quarta',
    'Quinta',
    'Sexta',
    'Sábado',
    'Domingo',
  ];

  final List<String> _selectedWeekDays = [];

  DateTime? _openingTime;
  DateTime? _closingTime;

  @override
  void dispose() {
    _descriptionEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKeyAdditionalInfo,
      child: Consumer<RegisterController>(
        builder: (context, controller, child) {
          return Column(
            children: [
              // SizedBox(
              //   width: context.percentageWidth(0.35),
              //   child: TextFormField(
              //     // key: _openingTimeFormFieldKey,
              //     // onTap: () => _selectOpeningTime(context),
              //     readOnly: true,
              //     // expands: true,
              //     // maxLines: ,]
              //     expands: true, // add this line
              //     minLines: null, // add this line
              //     maxLines: null, // add this line
              //     decoration: InputDecoration(
              //       label: Wrap(
              //         spacing: 6.0,
              //         runSpacing: 3.0,
              //         alignment: WrapAlignment.center,
              //         children: _weekDays.map((dia) {
              //           final bool isSelected = _selectedWeekDays.contains(dia);
              //           return FilterChip(
              //             label: Text(dia),
              //             selected: isSelected,
              //             onSelected: (selected) =>
              //                 _onSelectedDiasDaSemana(dia, selected),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //     validator: Validatorless.multiple(
              //       [
              //         Validatorless.required("Obrigatório"),
              //         // Validatorless.min(
              //         //     6, "Confirma senha deve conter ao menos 6 caracteries!"),
              //         // Validatorless.compare(
              //         // _closingTimeFormFieldKey.currentState!.value , "As senhas estão diferentes!"),
              //       ],
              //     ),
              //   ),
              // ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 6.0,
                    runSpacing: 3.0,
                    alignment: WrapAlignment.center,
                    children: _weekDays.map((dia) {
                      final bool isSelected = _selectedWeekDays.contains(dia);
                      return FilterChip(
                        label: Text(dia),
                        selected: isSelected,
                        onSelected: (selected) =>
                            _onSelectedDiasDaSemana(dia, selected),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Visibility(
                visible: controller.organizationOpeningDays.isEmpty,
                child: Text(
                  controller.errorOpeningDay,
                  textAlign: TextAlign.center,
                  style: context.textStyles.textRegular.copyWith(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
              const Divider(),
              Text(
                "Selecione o horário de funcionamento da sua empresa",
                style: context.textStyles.textMedium,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () => _selectOpeningTime(context),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 10, vertical: 10),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Colors.grey[400]!,
                  //         width: 1.0,
                  //       ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         const Icon(Icons.access_time),
                  //         const SizedBox(width: 8),
                  //         Text(
                  //           controller.organizationOpeningTime != ''
                  //               ? controller.organizationOpeningTime
                  //               : "Abertura",
                  //           style: const TextStyle(fontSize: 12),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    width: context.percentageWidth(0.35),
                    child: TextFormField(
                      key: _openingTimeFormFieldKey,
                      onTap: () => _selectOpeningTime(context),
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.access_time),
                            const SizedBox(width: 3),
                            Text(
                              "Abertura",
                              style: context.textStyles.textLight.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required("Obrigatório!"),
                          // Validatorless.min(
                          //     6, "Confirma senha deve conter ao menos 6 caracteries!"),
                          // Validatorless.compare(
                          // _closingTimeFormFieldKey.currentState!.value , "As senhas estão diferentes!"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  SizedBox(
                    width: context.percentageWidth(0.38),
                    child: TextFormField(
                      key: _closingTimeFormFieldKey,
                      onTap: () => _selectClosingTime(context),
                      readOnly: true,
                      decoration: InputDecoration(
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.access_time_filled),
                            const SizedBox(width: 3),
                            Text(
                              "Fechamento",
                              style: context.textStyles.textLight.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required("Obrigatório!"),
                          // Validatorless.min(
                          //     6, "Confirma senha deve conter ao menos 6 caracteries!"),
                          // Validatorless.compare(controller, message)
                          // Validatorless.compare(
                          // _closingTimeFormFieldKey.currentState!.value , "As senhas estão diferentes!"),
                        ],
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () => _selectClosingTime(context),
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 10, vertical: 10),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Colors.grey[400]!,
                  //         width: 1.0,
                  //       ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         const Icon(Icons.access_time_filled_rounded),
                  //         const SizedBox(width: 8),
                  //         Text(
                  //           controller.organizationClosingTime != ''
                  //               ? controller.organizationClosingTime
                  //               : "Fechamento",
                  //           // _closingTime != null
                  //           //     ? '${_closingTime!.hour.toString().padLeft(2, '0')}:${_closingTime!.minute.toString().padLeft(2, '0')}'
                  //           //     : 'Fechamento',
                  //           style: const TextStyle(fontSize: 12),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              // Visibility(
              //   visible: controller.organizationClosingTime !=
              //       controller.organizationOpeningTime,
              //   child: Text(
              //     "Horário de abertura não pode ser igual ao fechamento.",
              //     style: context.textStyles.textRegular.copyWith(
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 10),
              const Divider(),
              Text(
                "Faça uma pequena descrição da sua empresa",
                style: context.textStyles.textMedium,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionEC,
                validator: Validatorless.required(
                  'Descrição é obrigatória',
                ),
                maxLines: 5,
                maxLength: 1000,
                decoration: const InputDecoration(
                  labelText: 'Descrição da empresa',
                  hintText: 'Descreva a loja em poucas palavras',
                ),
                onChanged: (text) =>
                    controller.organizationDescription = _descriptionEC.text,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _selectOpeningTime(BuildContext context) async {
    final controller = Provider.of<RegisterController>(context, listen: false);
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      cancelText: "Voltar",
      helpText: "Horário de Abertura",
      hourLabelText: "Hora",
      minuteLabelText: "Minuto",
    );
    if (pickedTime != null) {
      setState(() {
        _openingTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _openingTimeFormFieldKey.currentState!.didChange(
            '${_openingTime!.hour.toString().padLeft(2, '0')}:${_openingTime!.minute.toString().padLeft(2, '0')}');
      });

      controller.organizationOpeningTime =
          '${_openingTime!.hour.toString().padLeft(2, '0')}:${_openingTime!.minute.toString().padLeft(2, '0')}';
    }
  }

  Future<void> _selectClosingTime(BuildContext context) async {
    final controller = Provider.of<RegisterController>(context, listen: false);

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      cancelText: "Voltar",
      helpText: "Horário de Fechamento",
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _closingTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          pickedTime.hour,
          pickedTime.minute,
        );
        _closingTimeFormFieldKey.currentState!.didChange(
            '${_closingTime!.hour.toString().padLeft(2, '0')}:${_closingTime!.minute.toString().padLeft(2, '0')}');
      });
      controller.organizationClosingTime =
          '${_closingTime!.hour.toString().padLeft(2, '0')}:${_closingTime!.minute.toString().padLeft(2, '0')}';
    }
  }

  void _onSelectedDiasDaSemana(String dia, bool selected) {
    final controller = Provider.of<RegisterController>(context, listen: false);

    setState(() {
      if (selected) {
        _selectedWeekDays.add(dia);
        controller.organizationOpeningDays = _selectedWeekDays;
      } else {
        _selectedWeekDays.remove(dia);
        controller.organizationOpeningDays = _selectedWeekDays;
      }
    });
  }
}
