// import 'package:litoral_delivery_parceiros/app/core/extentions/capitalize_extention.dart';
// import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:validatorless/validatorless.dart';

// import '../../../core/formatter/phone_input_formatter.dart';
// import '../../../models/organization_model.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final _formKey = GlobalKey<FormState>();

//   final GlobalKey<FormFieldState<String>> _categoriaFormFieldKey =
//       GlobalKey<FormFieldState<String>>();

//   final _organizationNameEC = TextEditingController();
//   final _emailEC = TextEditingController();
//   final _passwordEC = TextEditingController();
//   final _numberController = TextEditingController();

//   OrganizationCategory _categoriaSelecionada = OrganizationCategory.lanchonete;

//   var _showPassword = false;

//   @override
//   void dispose() {
//     _organizationNameEC.dispose();
//     _emailEC.dispose();
//     _passwordEC.dispose();
//     super.dispose();
//   }

//   Future<void> _exibirDialogSelecaoCategoria(BuildContext context) async {
//     final categoriaSelecionada = await showDialog<OrganizationCategory>(
//       context: context,
//       builder: (BuildContext context) {
//         return SimpleDialog(
//           title: const Text(
//             'Selecione uma categoria',
//             textAlign: TextAlign.center,
//           ),
//           children: OrganizationCategory.values
//               .map((categoria) => SimpleDialogOption(
//                     onPressed: () {
//                       Navigator.pop(context, categoria);
//                     },
//                     child: Column(
//                       children: [
//                         Text(categoria.toString().split('.').last.capitalize()),
//                         const Divider(),
//                       ],
//                     ),
//                   ))
//               .toList(),
//         );
//       },
//     );

//     if (categoriaSelecionada != null) {
//       setState(() {
//         _categoriaSelecionada = categoriaSelecionada;
//         _categoriaFormFieldKey.currentState!.didChange(
//             categoriaSelecionada.toString().split('.').last.capitalize());
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Cadastre sua Loja",
//           style: context.textStyles.textTitle.copyWith(
//             color: Colors.black,
//           ),
//         ),
//         elevation: 0.5,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Preencha os campos abaixo para cadastrar sua loja em nosso catálogo",
//                   textAlign: TextAlign.justify,
//                   style: context.textStyles.textMedium.copyWith(
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _organizationNameEC,
//                   decoration: const InputDecoration(labelText: "Nome da loja"),
//                   validator: Validatorless.required("Nome da loja"),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: _emailEC,
//                   decoration: const InputDecoration(labelText: "E-mail"),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: Validatorless.multiple(
//                     [
//                       Validatorless.required("E-mail obrigatório"),
//                       Validatorless.email("E-mail inválido!"),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   key: _categoriaFormFieldKey,
//                   readOnly: true,
//                   onTap: () {
//                     _exibirDialogSelecaoCategoria(context);
//                   },
//                   decoration: const InputDecoration(
//                     labelText: 'Qual a categoria da sua loja?',
//                     hintText: 'Selecione uma categoria',
//                     suffixIcon: Icon(Icons.arrow_drop_down),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Selecione uma categoria';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: _numberController,
//                   keyboardType: TextInputType.number,
//                   inputFormatters: [
//                     FilteringTextInputFormatter.digitsOnly,
//                     PhoneInputFormatter(),
//                   ],
//                   decoration: const InputDecoration(
//                     labelText: 'Número para contato',
//                   ),
//                   validator: Validatorless.multiple(
//                     [
//                       Validatorless.required('Campo obrigatório'),
//                       Validatorless.number('Número inválido'),
//                       Validatorless.min(
//                           10, 'Número deve ter pelo menos 10 dígitos'),
//                     ],
//                   ),
//                 ),
                // const SizedBox(height: 20),
                // StatefulBuilder(
                //   builder: (context, setState) => TextFormField(
                //     obscureText: !_showPassword,
                //     controller: _passwordEC,
                //     decoration: InputDecoration(
                //       labelText: "Senha",
                //       suffixIcon: IconButton(
                //         onPressed: () {
                //           setState(() {
                //             _showPassword = !_showPassword;
                //           });
                //         },
                //         icon: Icon(
                //           _showPassword
                //               ? Icons.lock_open_rounded
                //               : Icons.lock_outlined,
                //         ),
                //       ),
                //     ),
                //     validator: Validatorless.multiple(
                //       [
                //         Validatorless.required("Senha obrigatória"),
                //         Validatorless.min(
                //             6, "Senha deve conter ao menos 6 caracteries!"),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20),
                // StatefulBuilder(
                //   builder: (context, setState) => TextFormField(
                //     obscureText: !_showPassword,
                //     decoration: InputDecoration(
                //       labelText: "Confirma senha",
                //       suffixIcon: IconButton(
                //         onPressed: () {
                //           setState(() {
                //             _showPassword = !_showPassword;
                //           });
                //         },
                //         icon: Icon(
                //           _showPassword
                //               ? Icons.lock_open_rounded
                //               : Icons.lock_outlined,
                //         ),
                //       ),
                //     ),
                //     validator: Validatorless.multiple(
                //       [
                //         Validatorless.required("Confirma senha obrigatória"),
                //         Validatorless.min(6,
                //             "Confirma senha deve conter ao menos 6 caracteries!"),
                //         Validatorless.compare(
                //             _passwordEC, "As senhas estão diferentes!"),
                //       ],
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
//                 SizedBox(
//                   width: 150,
//                   height: 45,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: const Text("Registrar loja"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
