import 'package:cardiones/design/design.dart';
import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/providers/providers.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final List<String> insulina = [
  '1700',
  '2100',
];

class VistaTresPages extends StatelessWidget {
  static const String routeName = '/VistaTres';
  const VistaTresPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vista Tres'),
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
            _formVistatres(),
          ],
        ),
      ),
    ));
  }
}

class _formVistatres extends StatefulWidget {
  @override
  State<_formVistatres> createState() => __formVistatresState();
}

class __formVistatresState extends State<_formVistatres> {
  final sensibilidadCrtl = TextEditingController();
  final insulinaaldiaCrtl = TextEditingController();
  String selectInsulina = '1700';
  @override
  Widget build(BuildContext context) {
    final calInsulina = Provider.of<CalcularInsulinaProvider>(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          spacing: 40,
          children: [
            DropdownInsulina(
              items: insulina,
              onChanged: (value) {
                setState(() {
                  selectInsulina = value;
                });
              },
            ),
            CustonInput(
              icon: Icons.pending_actions,
              hintText: 'Insulina total por día',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              placeholder: 'Insulina total por día',
              textController: insulinaaldiaCrtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () {
                    double? sensibilidad = double.tryParse(selectInsulina);
                    double? insulinaaldia =
                        double.tryParse(insulinaaldiaCrtl.text);
                    calInsulina.calcularRatio(sensibilidad!, insulinaaldia!);
                  },
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  child: Icon(
                    Icons.calculate,
                    color: ColorExacto.colorBlanco,
                  ),
                )
              ],
            ),
            CalcularInsulina(calInsulina: calInsulina)
          ],
        ),
      ),
    );
  }
}

class CalcularInsulina extends StatelessWidget {
  const CalcularInsulina({
    super.key,
    required this.calInsulina,
  });

  final CalcularInsulinaProvider calInsulina;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorExacto.colorFondoAzul,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Resultado : ${calInsulina.ratio} UI',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
