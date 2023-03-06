// import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:validatorless/validatorless.dart';

// import '../../../core/ui/base_state/base_state.dart';
// import 'controller/login_controller.dart';
// import 'controller/login_state.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends BaseState<LoginPage, LoginController> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailEC = TextEditingController();
//   final _passwordEC = TextEditingController();

//   bool _showPassword = false;

//   @override
//   void dispose() {
//     _emailEC.dispose();
//     _passwordEC.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           const SizedBox(
//             height: 20,
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: BlocListener<LoginController, LoginState>(
//                 listener: (context, state) {
//                   state.status.matchAny(
//                     any: () => hideLoader(),
//                     success: () {
//                       hideLoader();
//                       Navigator.pop(
//                           context, true); // true: para saber que fez login!
//                     },
//                     error: () {
//                       hideLoader();
//                       showError("Erro ao realizar login!");
//                     },
//                     login: () => showLoader(),
//                     loginError: () {
//                       hideLoader();
//                       showError("Login ou senha inválidos!");
//                     },
//                   );
//                 },
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Login",
//                         style: context.textStyles.textTitle,
//                       ),
//                       const SizedBox(height: 30),
//                       TextFormField(
//                         controller: _emailEC,
//                         keyboardType: TextInputType.emailAddress,
//                         decoration: const InputDecoration(labelText: "E-mail"),
//                         validator: Validatorless.multiple(
//                           [
//                             Validatorless.required("E-mail obrigatório!"),
//                             Validatorless.email("Email inválido."),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 30),
//                       StatefulBuilder(
//                         builder: (context, setState) => TextFormField(
//                           obscureText: !_showPassword,
//                           controller: _passwordEC,
//                           decoration: InputDecoration(
//                             labelText: "Senha",
//                             suffixIcon: IconButton(
//                               onPressed: () {
//                                 setState(() => _showPassword = !_showPassword);
//                               },
//                               icon: Icon(
//                                 _showPassword
//                                     ? Icons.lock_open_rounded
//                                     : Icons.lock_outlined,
//                               ),
//                             ),
//                           ),
//                           validator: Validatorless.multiple(
//                             [
//                               Validatorless.required("Senha obrigatória!"),
//                               Validatorless.min(6,
//                                   "Senha deve conter ao menos 6 caracteries!"),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 50),
//                       // Center(
//                       //   child: DeliveryButton(
//                       //     width: double.infinity,
//                       //     label: "ENTRAR",
//                       //     onPressed: () {
//                       //       final bool valid =
//                       //           _formKey.currentState?.validate() ?? false;

//                       //       if (valid) {
//                       //         controller.login(
//                       //           _emailEC.text,
//                       //           _passwordEC.text,
//                       //         );
//                       //       }
//                       //     },
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Não possui conta?",
//                         style: context.textStyles.textBold),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pushNamed("/auth/register");
//                       },
//                       child: Text(
//                         "Cadastre-se.",
//                         style: context.textStyles.textBold.copyWith(
//                           color: Colors.blueAccent,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(),
    );
  }
}
