import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderMixin<T extends StatefulWidget> on State<T> {
  bool isOpen = false;

  void showLoader(){
    if(!isOpen) {
      isOpen=true;
      showDialog(
        context: context,
        builder: (context){
          return LoadingAnimationWidget.threeArchedCircle(size: 60, color: Colors.white);
        }
      );
    }
  }
  void hideLoader(){
    if(isOpen){
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}