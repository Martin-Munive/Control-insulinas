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
  String selectedMedico = items.first;
  String selectedEnfermedad = enfermedad.first;
  String selectedMedicamento = medicamento.first;
  final cantidadtextController1 = TextEditingController();
  final cantidadtextController2 = TextEditingController();
  final cantidadtextController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: listaDeOpciones(),
      ),
    );
  }

  Column listaDeOpciones() {
    return Column(
      spacing: 20,
      children: [
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownbuttonWidget(
                items: items,
                onChanged: (String value) {
                  setState(() {
                    selectedMedico = value;
                  });
                },
              ),
            ),
            Expanded(
              child: CustonInput(
                  icon: Icons.numbers,
                  placeholder: 'Cantidad',
                  textController: cantidadtextController1,
                  hintText: 'Cantidad',
                  keyboardType: TextInputType.number),
            ),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownbuttonWidget(
                items: enfermedad,
                onChanged: (String value) {
                  setState(() {
                    selectedEnfermedad = value;
                  });
                },
              ),
            ),
            Expanded(
              child: CustonInput(
                  icon: Icons.numbers,
                  placeholder: 'Cantidad',
                  textController: cantidadtextController2,
                  hintText: 'Cantidad',
                  keyboardType: TextInputType.number),
            ),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownbuttonWidget(
                items: medicamento,
                onChanged: (String value) {
                  setState(() {
                    selectedMedicamento = value;
                  });
                },
              ),
            ),
            Expanded(
              child: CustonInput(
                  icon: Icons.numbers,
                  placeholder: 'Cantidad',
                  textController: cantidadtextController3,
                  hintText: 'Cantidad',
                  keyboardType: TextInputType.number),
            ),
          ],
        ),
        calcularCarbohidratos(),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorExacto.colorFondoAzul,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Resultado :0.0 UI',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        )
      ],
    );
  }

  FloatingActionButton calcularCarbohidratos() {
    return FloatingActionButton(
      onPressed: () {
        print("Médico seleccionado: $selectedMedico");
        print("Enfermedad seleccionada: $selectedEnfermedad");
        print("Medicamento seleccionado: $selectedMedicamento");
      },
      child: Icon(
        Icons.calculate,
        color: ColorExacto.colornnegroLetras,
      ),
      backgroundColor: Colors.blue,
    );
  }
}
