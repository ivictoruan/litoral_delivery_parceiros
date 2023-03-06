import 'package:litoral_delivery_parceiros/app/core/ui/helpers/size_extentions.dart';
import 'package:litoral_delivery_parceiros/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String homeAnimation = "assets/lotties/splash_bike_delivery.json";
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString(homeAnimation),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return LottieBuilder.asset(
                    homeAnimation,
                    fit: BoxFit.cover,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          //   Lottie.asset(
          //     homeAnimation,
          //     width: context.screenWidth,
          //     height: 300,
          //     fit: BoxFit.cover,

          //   // ),
          // ),
          const SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Olá",
                    style: context.textStyles.textExtraBold.copyWith(
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Aumente suas vendas sendo um parceiro Litoral Delivery!",
                  textAlign: TextAlign.start,
                  style: context.textStyles.textExtraBold.copyWith(
                    fontSize: 23,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 165,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("/auth/register");
                        },
                        child: Text(
                          "Cadastre-se!",
                          style: context.textStyles.textBold.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 165,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed("/auth/login");
                        },
                        child: Text(
                          "Entre",
                          style: context.textStyles.textBold.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
