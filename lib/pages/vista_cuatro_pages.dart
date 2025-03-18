import 'package:cardiones/design/design.dart';
import 'package:cardiones/pages/pages.dart';
import 'package:cardiones/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VistaCuatroPages extends StatelessWidget {
  static const String name = "/VistaCuatroPages";
  const VistaCuatroPages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vista cuatro'),
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
            _formVistacuatro(),
          ],
        ),
      ),
    ));
  }
}

class _formVistacuatro extends StatefulWidget {
  @override
  State<_formVistacuatro> createState() => __formVistacuatroState();
}

class __formVistacuatroState extends State<_formVistacuatro> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () {
                    print(pulsoCrtl.text);
                    print(alturaCrtl.text);
                    print(pesoCrtl.text);
                  },
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  child: Icon(
                    Icons.filter_frames_outlined,
                    color: ColorExacto.colornnegroLetras,
                  ),
                ),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () {
                    print(pulsoCrtl.text);
                    print(alturaCrtl.text);
                    print(pesoCrtl.text);
                  },
                  backgroundColor: Colors.blue,
                  elevation: 5,
                  child: Icon(
                    Icons.list_alt_outlined,
                    color: ColorExacto.colornnegroLetras,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
