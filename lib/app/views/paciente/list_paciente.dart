import 'package:app_medico/app/views/paciente/add_paciente.dart';
import 'package:app_medico/app/model/paciente.dart';
import 'package:app_medico/app/views/paciente/view_paciente.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListPaciente extends StatefulWidget {
  @override
  _ListPacienteState createState() => _ListPacienteState();
}
class _ListPacienteState extends State<ListPaciente> {

  Database? _database;
  List<Paciente> personsList = [];

  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  getDatabase() async {
    Database db = await openDatabase(
        join(await getDatabasesPath(), 'person_database.db'),
        version: 1,
    );
    setState(() {
      _database = db;
    });
    readAll();
  }

  readAll() async {
    final List<Map<String, dynamic>> maps = await _database!.query('paciente');

    personsList = List.generate(maps.length, (i) {
      return Paciente(
          maps[i]['name'],
          maps[i]['dataNascimento'],
          maps[i]['cpf'],
          maps[i]['address'],
          maps[i]['telefone'],
          maps[i]['email'],
          maps[i]['convenio'],
          maps[i]['numCarteirinha'],
          id: maps[i]['id']
      );
    });
    setState(() {});
  }

  insertPerson(Paciente paciente) {
    _database?.insert(
      'paciente',
      paciente.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    ).then((value) {
      paciente.id = value;
      setState(() {
        personsList.add(paciente);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoas"),
        actions: <Widget>[
          if (_database != null) IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddPaciente()
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
        itemCount: personsList.length,
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
          leading: Text("${personsList[index].id}"),
          title: Text(personsList[index].name),
          onLongPress: (){
            deletePerson(index);
          },
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ViewPaciente(personsList[index].name,
                                                     personsList[index].dataNascimento,
                                                     personsList[index].cpf,
                                                     personsList[index].address,
                                                     personsList[index].telefone,
                                                     personsList[index].email,
                                                     personsList[index].convenio,
                                                     personsList[index].numCarteirinha),
                )
            );
          },
        ),
      ),
    );
  }

  deletePerson(int index) {
    _database?.delete(
      'paciente',
      where: "id = ?",
      whereArgs: [personsList[index].id],
    ).then((value) {
      setState(() {
        personsList.removeAt(index);
      });
    });
  }

}