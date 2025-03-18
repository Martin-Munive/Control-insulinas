// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// class BDProvider {
//   static Database? _database;

//   static final BDProvider db = BDProvider._();

//   BDProvider._();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await initDB();

//     return _database!;
//   }

//   Future<Database> initDB() async {
//     // Aqui se crea la base de datos
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'Caloria.db');
//     // print('rutaaaaaaaaaa:$path');
//     debugPrint('Ruta de la BD: $path');

//     // crear db
//     return await openDatabase(
//       path,
//       version: 3,
//       onOpen: (db) {},
//       onCreate: (Database db, int version) async {
//         await db.execute('''
//           CREATE TABLE alimento(
//             id INTEGER PRIMARY KEY,
//             nombre TEXT NOT NULL,
//             tamanoporcion TEXT NOT NULL,
//             pesoengramo REAL NOT NULL,
//             gramochos REAL NOT NULL
//           )
//         ''');
//       },
//     );
//   }
// }
