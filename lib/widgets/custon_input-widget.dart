import 'package:cardiones/design/design.dart';
import 'package:flutter/material.dart';

class CustonInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;

  final String hintText;
  const CustonInput(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      required this.hintText,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 5),
            )
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: textController,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorExacto.colornnegroLetras,
          ),
          hintText: hintText,
          labelText: placeholder,
          labelStyle: TextStyle(color: ColorExacto.colorFondoAzul),
          border: InputBorder.none,
          suffixText: 'mg/dL',
          suffixStyle: TextStyle(color: ColorExacto.colornnegroLetras),
        ),
      ),
    );
  }
}
