import 'package:flutter/material.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:provider/provider.dart';

import '../../core/ui/widgets/custom_oval_image.dart';
import '../../core/ui/widgets/custom_will_pop_scope.dart';
import '../auth/register/controller/register_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWillPopScope(
      message: "Deseja voltar para o início?",
      routeToBack: "/",
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Consumer<RegisterController>(
                builder: (context, controller, child) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Assim que seus clientes verão quando visitarem sua empresa",
                        textAlign: TextAlign.center,
                        style: context.textStyles.textTitle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      Card(
                        child: SizedBox(
                          height: 400,
                          width: 500,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const CustomOvalImage(
                                imagePathUrl:
                                    "https://img.elo7.com.br/product/original/3082945/logotipo-personalizado-mesa.jpg",
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          controller.organizationName,
                                          style:
                                              context.textStyles.textSemiBold,
                                        )),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        controller.organizationDescription,
                                        style: context.textStyles.textRegular,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const CustomOvalImage(
                                      imagePathUrl:
                                          "https://guiaog.com.br/uploads/vitrine/upsppmI2Hi4RiekdkNRe.jpg",
                                    );
                                  },
                                ),
                              ),
                              const Divider(),
                              Container(
                                constraints:
                                    const BoxConstraints(maxHeight: 100),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, // número de colunas
                                  ),
                                  itemCount: 3, // número total de itens
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      width: 90,
                                      height: 90,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://guiaog.com.br/uploads/vitrine/upsppmI2Hi4RiekdkNRe.jpg",
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1, end: 1.2),
                duration: const Duration(milliseconds: 500),
                builder: (BuildContext context, double scale, Widget? child) {
                  return Transform.scale(
                    scale: scale,
                    child: FilledButton(
                      onPressed: () => Navigator.popAndPushNamed(
                          context, "/registerProduct"),
                      child: const Text("Adicione seu 1º produto!"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
