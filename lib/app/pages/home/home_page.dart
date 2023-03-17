import 'package:flutter/material.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';

import '../../core/ui/widgets/custom_oval_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(''),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: Column(
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
                        "controller.organizationName",
                        style: context.textStyles.textSemiBold,
                      )),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "controller.organizationDescription",
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
                itemBuilder: (BuildContext context, int index) {
                  return const CustomOvalImage(
                    imagePathUrl:
                        "https://guiaog.com.br/uploads/vitrine/upsppmI2Hi4RiekdkNRe.jpg",
                  );
                },
              ),
            ),
            const Divider(),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3, // número de colunas
                  ),
                  itemCount: 8, // número total de itens
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // log("Abre uma  página de produto");
                        Navigator.pushNamed(context, '/productDetails');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 2),
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
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
