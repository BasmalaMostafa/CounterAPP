import 'package:counterapp/shared/Components/contants.dart';
import 'package:flutter/material.dart';


class Components{
  const Components();

  final MyColors myColors = const MyColors();
  final FontSizes fontSizes = const FontSizes();

  Widget floatingButton({
  required String hero,
  required Color? color,
  required Function()? function,
  required String tip,
  required IconData? icon
}) => FloatingActionButton(
    heroTag: hero,
    backgroundColor: color,
    onPressed: function,
    tooltip: tip,
    child: Icon(icon),
  );

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snack({
    required String text,
    required var context
}) => ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(text),
        duration: const Duration(microseconds: 300),
      )
  );

  Widget button({
    required String nav,
    required Color? color,
    required String text,
    required var context
})
 =>SizedBox(
    width: double.infinity,
    child: MaterialButton(
      onPressed: (){
        Navigator.of(context).pushNamed(nav);
      },
      color: color,
      child:  Text(text.toUpperCase(),
        style:  TextStyle(color: myColors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSizes.buttons
        ),),
    ),
  );

  Widget space() => SizedBox(height: const SizeBox().separator,);
}













