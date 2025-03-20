import 'package:cardiones/design/design.dart';
import 'package:flutter/material.dart';

class DropdownInsulina extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String>? onChanged;
  const DropdownInsulina({super.key, required this.items, this.onChanged});

  @override
  State<DropdownInsulina> createState() => _DropdownbuttonWidgetState();
}

class _DropdownbuttonWidgetState extends State<DropdownInsulina> {
  late String dropdownValue; // Se inicializa en initState

  @override
  void initState() {
    super.initState();
    dropdownValue =
        widget.items.first; // ✅ Ahora sí accedemos correctamente a 'items'
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorExacto.colorBlanco,
          boxShadow: [
            BoxShadow(
              color: ColorExacto.colornnegroLetras,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: DropdownButton<String>(
          isDense: true,
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_downward,
            size: 20,
            color: ColorExacto.colornnegroLetras,
          ),
          elevation: 16,
          style: const TextStyle(color: ColorExacto.colornnegroLetras),
          underline: Container(
            height: 2,
          ),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                dropdownValue = value;
              });
              widget.onChanged?.call(value);
            }
          },
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ));
  }
}
