import 'package:cardiones/design/design.dart';
import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';

final List<String> items = [
  'Medico Pediatra',
  'Medico General',
  'Medico Internista',
  'Medico Cardiologo',
];
final List<String> enfermedad = [
  'coronavirus',
  'fiebre',
  'tos seca',
  'ojitivitis',
];
final List<String> medicamento = [
  'Acetaminofen',
  'Dolex',
  'Ibuprofeno',
  'Paracetamol',
];

class VistaDosPages extends StatelessWidget {
  static const String routerName = '/VistaDos';
  const VistaDosPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vista Dos'),
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, OpcionesPages.name);
          },
          icon: Icon(Icons.arrow_back),
          color: ColorExacto.colornnegroLetras,
        ),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
        child: Column(
          children: [
            _formVista2(),
          ],
        ),
      ),
    ));
  }
}

class _formVista2 extends StatefulWidget {
  @override
  State<_formVista2> createState() => __formVista2State();
}

class __formVista2State extends State<_formVista2> {
  String dropdownValue = items.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          spacing: 40,
          children: [
            DropdownbuttonWidget(
              items: items,
            ),
            DropdownbuttonWidget(
              items: enfermedad,
            ),
            DropdownbuttonWidget(
              items: medicamento,
            ),
            FloatingActionButton(
              onPressed: () {
                print('guardar');
              },
              child: Icon(
                Icons.save,
                color: ColorExacto.colornnegroLetras,
              ),
              backgroundColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
