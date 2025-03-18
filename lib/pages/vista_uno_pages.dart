import 'package:cardiones/design/design.dart';
import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VistaUnoPages extends StatelessWidget {
  static const String routerName = '/VistaUno';
  const VistaUnoPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vista Uno'),
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
  final pulsoCrtl = TextEditingController();
  final alturaCrtl = TextEditingController();
  final pesoCrtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustonInput(
              icon: Icons.home_repair_service_outlined,
              hintText: 'Pulso',
              keyboardType: TextInputType.text,
              placeholder: 'Pulso',
              textController: pulsoCrtl,
            ),
            CustonInput(
              icon: Icons.bloodtype,
              hintText: 'tipo de sangre',
              keyboardType: TextInputType.text,
              placeholder: 'tipo de sangre',
              textController: alturaCrtl,
            ),
            CustonInput(
              icon: Icons.person,
              hintText: 'Nombre',
              keyboardType: TextInputType.text,
              placeholder: 'Nombre',
              textController: pesoCrtl,
            ),
            FloatingActionButton(
              onPressed: () {
                print(pulsoCrtl.text);
                print(alturaCrtl.text);
                print(pesoCrtl.text);
              },
              backgroundColor: Colors.blue,
              elevation: 5,
              child: Icon(Icons.list_alt_outlined),
            )
          ],
        ),
      ),
    );
  }
}
