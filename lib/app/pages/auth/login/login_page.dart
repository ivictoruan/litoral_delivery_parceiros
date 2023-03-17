import 'package:flutter/material.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  bool _showPassword = false;

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Litoral Delivery",
          style: context.textStyles.textBold.copyWith(),
        ),
        elevation: 0.5,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Lottie.network(
                        "https://assets1.lottiefiles.com/packages/lf20_pbl690j5.json",
                        height: 230,
                        alignment: Alignment.center,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _emailEC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: "E-mail"),
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required("E-mail obrigatório!"),
                          Validatorless.email("Email inválido."),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    StatefulBuilder(
                      builder: (context, setState) => TextFormField(
                        obscureText: !_showPassword,
                        controller: _passwordEC,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                            icon: Icon(
                              _showPassword
                                  ? Icons.lock_open_rounded
                                  : Icons.lock_outlined,
                            ),
                          ),
                        ),
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required("Senha obrigatória!"),
                            Validatorless.min(
                                6, "Senha deve conter ao menos 6 caracteries!"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: SizedBox(
                        width: 150,
                        height: 45,
                        child: Consumer<LoginController>(
                          builder: (context, controller, child) {
                            // Esse método garante que a chamada seja adiada para o próximo quadro de construção,
                            // permitindo que o widget seja construído totalmente antes de a chamada ser feita
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                controller.status.matchAny(
                                  any: () => hideLoader(),
                                  loading: () => showLoader(),
                                  error: () {
                                    hideLoader();
                                    showError(
                                      "Não foi possível fazer o login. Tente Novamente!",
                                    );
                                  },
                                  success: () {
                                    hideLoader();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      "/welcome",
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                );
                              },
                            );
                            return ElevatedButton(
                              child: const Text("ENTRAR"),
                              onPressed: () {
                                final bool valid =
                                    _formKey.currentState?.validate() ?? false;

                                if (valid) {
                                  controller.login(
                                    _emailEC.text,
                                    _passwordEC.text,
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Não possui conta?",
                        style: context.textStyles.textBold),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/auth/register"),
                      child: Text(
                        "Seja um parceiro.",
                        style: context.textStyles.textBold.copyWith(
                          color: Colors.yellow[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
