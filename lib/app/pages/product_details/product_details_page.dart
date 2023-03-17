import 'package:flutter/material.dart';

import '../../core/ui/widgets/custom_oval_image.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nome do Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                const CustomOvalImage(
                  imagePathUrl:
                      "https://img.elo7.com.br/product/original/3082945/logotipo-personalizado-mesa.jpg",
                ),
                const SizedBox(height: 5),
                Positioned(
                  right: 0,
                  bottom: 0,
                  // alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isEditing == true
                    ? SizedBox(width: 250, child: TextFormField())
                    : const Text("Nome"),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isEditing == true
                    ? SizedBox(width: 250, child: TextFormField())
                    : const Text("Preço"),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isEditing == true
                    ? SizedBox(width: 250, child: TextFormField())
                    : const Text("Descrição"),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
