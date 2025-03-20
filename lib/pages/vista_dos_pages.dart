import 'package:cardiones/design/design.dart';
import 'package:cardiones/models/models.dart';
import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/providers/providers.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VistaDosPages extends StatelessWidget {
  static const String routerName = '/VistaDos';
  const VistaDosPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vista Dos'),
          backgroundColor: Colors.blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, OpcionesPages.name);
              final carboProvider =
                  Provider.of<CalcularCarbohidratos>(context, listen: false);
              carboProvider.carbohidratos = 0;
            },
            icon: Icon(Icons.arrow_back),
            color: ColorExacto.colornnegroLetras,
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _formVista2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _formVista2 extends StatefulWidget {
  @override
  State<_formVista2> createState() => __formVista2State();
}

class __formVista2State extends State<_formVista2> {
  List<Map<String, dynamic>> items = alimentos
      .map((alimento) => {
            "nombre": "${alimento.nombre} - ${alimento.tamanoporcion}",
            "pesoengramo": alimento.pesoengramo,
            "gramochos": alimento.gramochos,
          })
      .toList();

  String selected1 = alimentos.first.nombre;
  String selected2 = alimentos.first.nombre;
  String selected3 = alimentos.first.nombre;

  final cantidadtextController1 = TextEditingController();
  final cantidadtextController2 = TextEditingController();
  final cantidadtextController3 = TextEditingController();
  final insulinaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            listaDeOpciones(),
          ],
        ),
      ),
    );
  }

  Column listaDeOpciones() {
    final carboProvider = Provider.of<CalcularCarbohidratos>(context);
    return Column(
      spacing: 20,
      children: [
        filaDropdownConInput(1, selected1, cantidadtextController1),
        filaDropdownConInput(2, selected2, cantidadtextController2),
        filaDropdownConInput(3, selected3, cantidadtextController3),
        CustonInputCantidad(
          icon: Icons.pending_actions,
          hintText: 'Insulina',
          keyboardType: TextInputType.number,
          placeholder: 'Insulina',
          textController: insulinaController,
        ),
        calcularCarbohidratos(),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorExacto.colorFondoAzul,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Resultado: ${carboProvider.carbohidratos} UI',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        )
      ],
    );
  }

  Widget filaDropdownConInput(
      int index, String selected, TextEditingController controller) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DropdownbuttonWidget(
            items: items,
            onChanged: (String value) {
              setState(() {
                if (index == 1) selected1 = value;
                if (index == 2) selected2 = value;
                if (index == 3) selected3 = value;
              });
            },
          ),
        ),
        Expanded(
          child: CustonInputCantidad(
            icon: Icons.numbers,
            placeholder: 'Cantidad',
            textController: controller,
            hintText: 'Cantidad',
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  FloatingActionButton calcularCarbohidratos() {
    return FloatingActionButton(
      onPressed: () {
        int? cantidad1 = int.tryParse(cantidadtextController1.text) ?? 0;
        int? cantidad2 = int.tryParse(cantidadtextController2.text) ?? 0;
        int? cantidad3 = int.tryParse(cantidadtextController3.text) ?? 0;
        final carboProvider =
            Provider.of<CalcularCarbohidratos>(context, listen: false);
        carboProvider.carbohidratos = 0.0;
        carboProvider.calcularCarbohidratos(
            cantidad1,
            items.firstWhere(
                (element) => element['nombre'] == selected1)['gramochos']);
        carboProvider.calcularCarbohidratos(
            cantidad2,
            items.firstWhere(
                (element) => element['nombre'] == selected2)['gramochos']);
        carboProvider.calcularCarbohidratos(
            cantidad3,
            items.firstWhere(
                (element) => element['nombre'] == selected3)['gramochos']);
        carboProvider
            .dosisInsulina(double.tryParse(insulinaController.text) ?? 0.0);
      },
      child: Icon(
        Icons.calculate,
        color: ColorExacto.colorBlanco,
      ),
      backgroundColor: Colors.blue,
    );
  }
}
