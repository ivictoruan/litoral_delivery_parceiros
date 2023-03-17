import 'package:litoral_delivery_parceiros/app/core/extentions/capitalize_extention.dart';
import 'package:litoral_delivery_parceiros/app/core/extentions/city_extention.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/helpers/size_extentions.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/register_controller.dart';

class ConfirmInfosWidget extends StatelessWidget {
  const ConfirmInfosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
      builder: (context, controller, child) {
        return Column(
          children: [
            const SizedBox(height: 5),
            Text(
              """
Esta é a última etapa:
1. Verifique se todas as informações estão corretas;

2. Informe uma senha para acessar sua conta.
            """,
              style: context.textStyles.textSemiBold.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 5),
            Material(
              color: Colors.grey[100],
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: context.screenWidth,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Informações básicas",
                        style:
                            context.textStyles.textTitle.copyWith(fontSize: 20),
                      ),
                      const Divider(),
                      Text(
                        "Nome da Empresa: ${controller.organizationName}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Email:  ${controller.organizationEmail}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Contato: ${controller.organizationContactNumber}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Categoria:  ${controller.organizationCategory.toString().split('.').last.capitalize()}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Nome do Responsável:  ${controller.organizationResponsibleName}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            maxRadius: 10,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Align(
                      //     alignment: Alignment.bottomRight,
                      //     child: IconButton(
                      //       icon: const Icon(Icons.edit),
                      //       onPressed: () {},
                      //     ),
                      //     // CircleAvatar(
                      //     //   maxRadius: 10,
                      //     //   backgroundColor: Colors.black,
                      //     // ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              color: Colors.grey[100],
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: context.screenWidth,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        "Localização/Endereço",
                        style:
                            context.textStyles.textTitle.copyWith(fontSize: 20),
                      ),
                      const Divider(),
                      Text(
                        "Rua:${controller.organizationStreet}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Cidade: ${controller.organizationCity.cityName}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Bairro: ${controller.organizationNeightborhood}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Número: ${controller.organizationNumber}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Complemento: ${controller.organizationComplement}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            maxRadius: 10,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Material(
              color: Colors.grey[100],
              elevation: 1,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: context.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Informações Adicionais",
                        style:
                            context.textStyles.textTitle.copyWith(fontSize: 20),
                      ),
                      const Divider(),
                      Text(
                        "Dias de funcionamento:",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 3.0,
                        alignment: WrapAlignment.center,
                        children: controller.organizationOpeningDays.map((dia) {
                          // final bool isSelected = _selectedWeekDays.contains(dia);
                          return FilterChip(
                            label: Text(dia),
                            // selected: isSelected,
                            onSelected: (selected) {},
                            // onSelected: (selected) =>
                            // _onSelectedDiasDaSemana(dia, selected),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5),
                          Text(
                            "Horário de abertura: ${controller.organizationOpeningTime}",
                            style: context.textStyles.textSemiBold,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.access_time_filled),
                          const SizedBox(width: 5),
                          Text(
                            "Horário de fechamento: ${controller.organizationClosingTime}",
                            style: context.textStyles.textSemiBold,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Complemento: ${controller.organizationComplement}",
                        style: context.textStyles.textSemiBold,
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            maxRadius: 10,
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
