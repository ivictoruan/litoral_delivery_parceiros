import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui/widgets/custom_will_pop_scope.dart';
import 'controller/register_controller.dart';
import 'steps/additional_infos_form_content.dart';
import 'steps/basic_infos_form_content.dart';
import 'steps/confirm_step.dart';
import 'steps/localization_form_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKeyBasicInfos = GlobalKey<FormState>();
  final _formKeyAddress = GlobalKey<FormState>();
  final _formKeyAdditionalInfo = GlobalKey<FormState>();

  final _formKeyConfirm = GlobalKey<FormState>();

  // void _saveValues(formKey) {
  //   formKey.currentState.save();
  // }

  int _currentStep = 0;
  // _stepTapped(int step) { //! REVER ESTA FUNÇÃO!
  //   setState(() => _currentStep = step);
  // }

  _stepContinue() {
    RegisterController controller =
        Provider.of<RegisterController>(context, listen: false);
    switch (_currentStep) {
      case 0:
        bool validBasic = _formKeyBasicInfos.currentState?.validate() ?? false;
        if (validBasic) {
          // _saveValues(_formKeyBasicInfos);
          _currentStep < 1 ? setState(() => _currentStep += 1) : null;
        }
        break;
      case 1:
        bool validAddress = _formKeyAddress.currentState?.validate() ?? false;
        if (validAddress) {
          // _saveValues(_formKeyAddress);

          _currentStep < 2 ? setState(() => _currentStep += 1) : null;
        }
        break;
      case 2:
        // log(controller.organizationOpeningDays.isEmpty.toString());
        // bool isOpeningAndClosingEqual = controller.organizationOpeningTime ==
        //     controller.organizationClosingTime;
        bool validAdditionalInfo =
            (_formKeyAdditionalInfo.currentState?.validate() ?? false) &&
                controller.organizationOpeningDays.isNotEmpty;
        // bool validAdditionalInfo =
        //     _formKeyAdditionalInfo.currentState?.validate() ?? false;

        if (validAdditionalInfo) {
          // _saveValues(_formKeyAdditionalInfo);
          _currentStep < 3 ? setState(() => _currentStep += 1) : null;
        } else if (controller.organizationOpeningDays.isEmpty) {
          controller.errorOpeningDays =
              "Você deve escolher ao menos um dia de funcionamento!";
        }
        break;
      case 3:
        bool confirmFormConfirm =
            _formKeyConfirm.currentState?.validate() ?? false;
        if (confirmFormConfirm) {
          controller.registerOrganization();
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/welcome",
            (Route<dynamic> route) => false,
          );
        }
        break;
    }
  }

  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomWillPopScope(
      message: "Deseja voltar para o início?",
      routeToBack: "/",
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cadastro",
          ),
          elevation: 0.5,
        ),
        body: Stepper(
          type: StepperType.vertical,
          elevation: 0.5,
          currentStep: _currentStep,
          // onStepTapped: (step) => _stepTapped(step),
          onStepContinue: () => _stepContinue(),
          onStepCancel: _stepCancel,
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    _currentStep == 3
                        ? Center(
                            child: SizedBox(
                              width: 150,
                              height: 40,
                              child: FilledButton(
                                onPressed: details.onStepContinue,
                                child: const Text("Registrar"),
                              ),
                            ),
                          )
                        : FilledButton(
                            onPressed: details.onStepContinue,
                            child: const Text('Próximo'),
                          ),
                    const SizedBox(
                      width: 10,
                    ),
                    _currentStep == 3
                        ? OutlinedButton(
                            onPressed: details.onStepCancel,
                            child: const Text(
                              'Corrigir',
                              style: TextStyle(),
                            ),
                          )
                        : TextButton(
                            onPressed: details.onStepCancel,
                            child: const Text('Voltar'),
                          ),
                  ],
                ),
              ],
            );
          },
          steps: [
            Step(
              state: _currentStep <= 0 ? StepState.editing : StepState.complete,
              isActive: _currentStep >= 0,
              title: Text(
                "Informações Básicas",
                style: context.textStyles.textTitle.copyWith(fontSize: 20),
              ),
              content: BasicInfosFormContent(
                formKeyBasicInfos: _formKeyBasicInfos,
              ),
            ),
            Step(
              state: _currentStep <= 1 ? StepState.editing : StepState.complete,
              isActive: _currentStep >= 1,
              title: Text(
                "Localização/Endereço",
                style: context.textStyles.textTitle.copyWith(fontSize: 20),
              ),
              content: LocalizationFormContent(
                formKeyAddress: _formKeyAddress,
              ),
            ),
            Step(
              state: _currentStep <= 2 ? StepState.editing : StepState.complete,
              isActive: _currentStep >= 2,
              title: Text(
                "Informações Adicionais",
                style: context.textStyles.textTitle.copyWith(fontSize: 20),
              ),
              content: AdditionalInfosFormContent(
                formKeyAdditionalInfo: _formKeyAdditionalInfo,
              ),
            ),
            Step(
              state: _currentStep <= 3 ? StepState.editing : StepState.complete,
              isActive: _currentStep >= 3,
              title: Text(
                "Confirmar Informações",
                style: context.textStyles.textTitle.copyWith(fontSize: 20),
              ),
              content: ConfirmStep(
                formKeyConfirm: _formKeyConfirm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
