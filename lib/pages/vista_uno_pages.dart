import 'package:cardiones/design/design.dart';
import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/providers/providers.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VistaUnoPages extends StatelessWidget {
  static const String routerName = '/VistaUno';
  const VistaUnoPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Calcular Insulina'),
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
            _formVista1(),
          ],
        ),
      ),
    ));
  }
}

class _formVista1 extends StatefulWidget {
  @override
  State<_formVista1> createState() => __formVista1State();
}

class __formVista1State extends State<_formVista1> {
  final glucosaActualCrtl = TextEditingController();
  final glucosaMetaCrtl = TextEditingController();
  final sensibilidadCrtl = TextEditingController();
  double resultado = 0;
  @override
  Widget build(BuildContext context) {
    final calculorProvider = Provider.of<CalculosProvider>(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustonInput(
              icon: Icons.medication_liquid,
              hintText: 'Glucosa Actual',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              placeholder: 'Glucosa Actual',
              textController: glucosaActualCrtl,
            ),
            CustonInput(
              icon: Icons.medication_liquid,
              hintText: 'Glucosa Meta',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              placeholder: 'Glucosa Meta',
              textController: glucosaMetaCrtl,
            ),
            CustonInput(
              icon: Icons.sensor_occupied,
              hintText: 'Factor de sensibilidad',
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              placeholder: ' Factor de sensibilidad',
              textController: sensibilidadCrtl,
            ),
            FloatingActionButton(
              onPressed: () {
                double? glucosaActual = double.tryParse(glucosaActualCrtl.text);
                double? glucosaMeta = double.tryParse(glucosaMetaCrtl.text);
                double? sensibilidad = double.tryParse(sensibilidadCrtl.text);
                if (glucosaActual != null &&
                    glucosaMeta != null &&
                    sensibilidad != null &&
                    sensibilidad != 0) {
                  calculorProvider.calcular(
                      glucosaActual, glucosaMeta, sensibilidad);
                }
              },
              backgroundColor: Colors.blue,
              elevation: 5,
              child: Icon(
                Icons.list_alt_outlined,
                color: ColorExacto.colornnegroLetras,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorExacto.colorFondoAzul,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Resultado : ${calculorProvider.resultado} UI',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
