import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/formatter/real_input_formatter.dart';
import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/custom_oval_image.dart';
import '../../core/ui/widgets/custom_will_pop_scope.dart';
import 'controller/product_registration_controller_impl.dart';

class ProductRegistrationPage extends StatefulWidget {
  const ProductRegistrationPage({super.key});

  @override
  State<ProductRegistrationPage> createState() =>
      _ProductRegistrationPageState();
}

class _ProductRegistrationPageState extends BaseState<ProductRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomWillPopScope(
      message: "Deseja voltar?",
      routeToBack: "/welcome",
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar Produto'),
          elevation: 0.5,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.info_outline,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      log("oress");
                    },
                    child: const CustomOvalImage(
                      imagePathUrl:
                          "https://folhadomate.com/wp-content/uploads/2022/09/hamburguer-artesanal-696x464.jpg",
                    ),
                  ),
                  // const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Nome do Produto'),
                    validator:
                        Validatorless.required('Nome do produto é obrigatório'),
                    // onSaved: (value) => _Produto.name = value,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Preço'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      RealInputFormatter(centavos: true),
                    ],
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Preço é obrigatório'),
                        // Validatorless.number('Preço deve ser um número'),
                      ],
                    ),
                    // onSaved: (value) => _Produto.price = double.parse(value),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    validator:
                        Validatorless.required('Uma descrição é obrigatória'),
                    // onSaved: (value) => _Produto.description = value,
                  ),
                  const SizedBox(height: 40),
                  Consumer<ProductRegistrationControllerImpl>(
                    builder: (context, controller, child) {
                      return ElevatedButton(
                        onPressed: () {
                          bool valid =
                              _formKey.currentState?.validate() ?? false;
                          if (valid) {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                controller.register(
                                  "image",
                                  "name",
                                  "price",
                                  "description",
                                );
                                controller.status.matchAny(
                                  any: () => hideLoader(),
                                  initial: () {},
                                  loading: () => showLoader(),
                                  error: () => showError(
                                    "Não foi possível registrar o produto. Tente Novamente!",
                                  ),
                                  success: () {
                                    hideLoader();
                                    // showInfo("Produto Registrado!");
                                    showSuccess(
                                        "Produto Registrado com sucesso!");
                                    Navigator.pushNamed(context, '/home');
                                    // showError(
                                    //   "Não foi possível registrar o produto. Tente Novamente!",
                                    // );
                                  },
                                );

                                // controller.status.matchAny(
                                //   any: () => hideLoader(),
                                //   loading: () => showLoader(),
                                //   error: () {
                                //     hideLoader();
                                //     showError(
                                //       "Não foi possível fazer o login. Tente Novamente!",
                                //     );
                                //   },
                                //   success: () {
                                //     hideLoader();
                                //     Navigator.pushNamedAndRemoveUntil(
                                //       context,
                                //       "/welcome",
                                //       (Route<dynamic> route) => false,
                                //     );
                                //   },
                                // );
                              },
                            );
                            // controller.status.matchAny(
                            //   any: () {},
                            //   initial: () {},
                            //   error: () => showError("DEu err!"),
                            //   success: () {
                            //     //hide
                            //     showError("DEu err!");
                            //   },
                            // );
                          }
                        },
                        child: const Text('Registrar Produto'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class ProductRegistrationPage extends StatefulWidget {
//   @override
//   _ProductRegistrationPageState createState() => _ProductRegistrationPageState();
// }

// class _ProductRegistrationPageState extends State<ProductRegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _Produto = Produto();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Produto Registration'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Produto name'),
//                 validator: Validatorless.required('Produto name is required'),
//                 onSaved: (value) => _Produto.name = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//                 validator: Validatorless.compose([
//                   Validatorless.required('Price is required'),
//                   Validatorless.number('Price must be a number')
//                 ]),
//                 onSaved: (value) => _Produto.price = double.parse(value),
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Description'),
//                 validator: Validatorless.required('Description is required'),
//                 onSaved: (value) => _Produto.description = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Image URL'),
//                 validator: Validatorless.required('Image URL is required'),
//                 onSaved: (value) => _Produto.image = value,
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState.validate()) {
//                     _formKey.currentState.save();
//                     // Aqui você pode enviar os dados do produto para um serviço ou armazená-los em algum lugar
//                     print(_Produto.name);
//                     print(_Produto.price);
//                     print(_Produto.description);
//                     print(_Produto.image);
//                   }
//                 },
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
