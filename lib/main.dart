import 'package:app_medico/app/views/medicos/list_medicos.dart';
import 'package:app_medico/app/views/paciente/list_paciente.dart';
import 'package:flutter/material.dart';

import 'app/views/consulta/list_consultas.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo' ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity. adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/cadastrarPaciente': (context) => ListPaciente(),
        '/cadastrarMedicos': (context) => ListMedicos(),
        '/agendarConsulta': (context) => ListConsultas(),
      },
    );
  }
}


