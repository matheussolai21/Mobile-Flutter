import 'package:app_medico/app/model/consulta.dart';
import 'package:app_medico/app/views/consulta/view_consultas.dart';
import 'package:app_medico/app/views/paciente/add_paciente.dart';
import 'package:app_medico/app/model/paciente.dart';
import 'package:app_medico/app/views/paciente/view_paciente.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'add_consulta.dart';

class ListConsultas extends StatefulWidget {
  @override
  _ListPersonState createState() => _ListPersonState();
}
class _ListPersonState extends State<ListConsultas> {

  Database? _database;

  List<Consulta> consultaList = [];

  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  getDatabase() async {
    Database db = await openDatabase(
        join(await getDatabasesPath(), 'person_database.db'),
        version: 1
    );
    setState(() {
      _database = db;
    });
    readAll();
  }

  readAll() async {
    final List<Map<String, dynamic>> maps = await _database!.query('consultas');

    consultaList = List.generate(maps.length, (i) {
      return Consulta(
          maps[i]['nome_medico'],
          maps[i]['crm'],
          maps[i]['especialidade'],
          maps[i]['nome_paciente'],
          maps[i]['numCarteirinha'],
          maps[i]['dataConsulta'],
          maps[i]['cpf'],
          maps[i]['address'],
          maps[i]['telefone'],
          id: maps[i]['id']
      );
    });
    setState(() {});
  }

  insertPerson(Consulta person) {
    _database?.insert(
      'consultas',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value) {
      person.id = value;
      setState(() {
        consultaList.add(person);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultas"),
        actions: <Widget>[
          if (_database != null) IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddConsulta()
                  )
              ).then((newPerson) {
                if (newPerson != null){
                  insertPerson(newPerson);
                }
              });
            },
          )
        ],
      ),
      body: ListView.separated(
        itemCount: consultaList.length,
        itemBuilder: (context, index) => buildListItem(index,context),
        separatorBuilder: (context, index) => Divider(
          height: 1,
        ),
      ),
    );
  }

  Widget buildListItem(int index, BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          leading: Text("${consultaList[index].id}"),
          title: Text(consultaList[index].nome_paciente),
          subtitle:Text("Data: ${consultaList[index].dataConsulta} - ${consultaList[index].especialidade}") ,
          onLongPress: (){
            deletePerson(index);
          },
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewConsulta(
                        consultaList[index].nome_medico,
                        consultaList[index].crm,
                        consultaList[index].especialidade,
                        consultaList[index].nome_paciente,
                        consultaList[index].numCarteirinha,
                        consultaList[index].dataConsulta,
                        consultaList[index].cpf,
                        consultaList[index].address,
                        consultaList[index].telefone),
                )
            );
          },
        ),
      ),
    );
  }

  deletePerson(int index) {
    _database?.delete(
      'consultas',
      where: "id = ?",
      whereArgs: [consultaList[index].id],
    ).then((value) {
      setState(() {
        consultaList.removeAt(index);
      });
    });
  }
}