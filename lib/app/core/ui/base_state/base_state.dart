import 'package:flutter/material.dart';

import '../helpers/loader_mixin.dart';
import '../helpers/messages_mixin.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    with LoaderMixin, MessagesMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   controller = context.read<C>();
  //   WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
  //     onReady();
  //   }));
  // }
  // // método chamado quando a tela é contruída!
  // void onReady(){}
}
