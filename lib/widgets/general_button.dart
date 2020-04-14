import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlistapp/constants/colors.dart';
import 'package:flutterlistapp/constants/styles.dart';

class GeneralButton extends StatelessWidget {
  String text;

  Function callback;

  GeneralButton(this.text, this.callback);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 48.0,
          minWidth: 150.0,
          maxHeight: 48.0,
          maxWidth: 300.0,
        ),
        child: OutlineButton(
          child: new Text(text, style: GENERAL_BUTTON_TEXT_STYLE,),
          borderSide: BorderSide(
              color: AppColors.MAIN_BUTTON_BORDER,
              style: BorderStyle.solid,
              width: 1),
          onPressed: callback,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(22.0)),
    ));
  }
}
