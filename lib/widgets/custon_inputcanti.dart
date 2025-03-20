import 'package:cardiones/design/design.dart';
import 'package:flutter/material.dart';

class CustonInputCantidad extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final Function(String)? onChanged;

  final String hintText;
  const CustonInputCantidad(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      required this.hintText,
      required this.keyboardType,
      this.onChanged});

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
        focusNode: FocusNode(),
        keyboardType: keyboardType,
        controller: textController,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorExacto.colornnegroLetras,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: ColorExacto.colornnegroLetras),
          labelText: placeholder,
          labelStyle: TextStyle(color: ColorExacto.colorFondoAzul),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
