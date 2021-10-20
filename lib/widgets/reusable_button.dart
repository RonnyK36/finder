import 'package:flutter/material.dart';

ElevatedButton reusableButton(
  context, {
  VoidCallback? onPressed,
  String? buttonName,
  IconData? icon,
}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        elevation: MaterialStateProperty.all(6),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        shadowColor: MaterialStateProperty.all(Colors.green)),
    onPressed: onPressed,
    child: Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(buttonName!),
          Icon(icon),
        ],
      ),
    ),
  );
}
