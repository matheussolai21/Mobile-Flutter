import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database? _database;
  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  getDatabase() async {
    Database db = await openDatabase(
        join(await getDatabasesPath(), 'person_database.db'),
        version: 1,
        onCreate: _criarTabela
    );
    setState(() {
      _database = db;
    });
    // readAll();
  }

  _criarTabela(Database db, int novaVersao) async {

    List<String> queryes = [
      "CREATE TABLE paciente( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dataNascimento TEXT, cpf TEXT, address TEXT, telefone TEXT, email TEXT, convenio TEXT, numCarteirinha TEXT )",
      "CREATE TABLE medicos( id INTEGER PRIMARY KEY AUTOINCREMENT, nome_medico TEXT, dataNascimento TEXT, cpf TEXT, address TEXT, telefone TEXT, email TEXT, crm TEXT,especialidade TEXT );",
      "CREATE TABLE consultas( id INTEGER PRIMARY KEY AUTOINCREMENT, nome_medico TEXT,crm TEXT,especialidade TEXT,nome_paciente TEXT,numCarteirinha TEXT ,dataConsulta TEXT, cpf TEXT, address TEXT, telefone TEXT );",
    ];
    for (String query in queryes) {
      await db.execute(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Médicos" ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_box, size: 40),
            title: Text("Cadastrar Paciente"),
            subtitle: Text("Lista de Pessoas" ),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator. pushNamed(context, "/cadastrarPaciente");
            },
          ),
          Divider(
            height: 1,
            color: Colors. black54,
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined, size: 40),
            title: Text("Cadastra Médicos"),
            subtitle: Text("Lista de Médicos" ),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator. pushNamed(context, "/cadastrarMedicos");
            },
          ),
          Divider(
            height: 1,
            color: Colors. black54,
          ),
          ListTile(
            leading: Icon(Icons.calendar_month, size: 40),
            title: Text("Agendar Consulta"),
            subtitle: Text("Consultas" ),
            trailing: Icon(Icons.navigate_next),
            onTap: (){
              Navigator. pushNamed(context, "/agendarConsulta");
            },
          ),
          Divider(
            height: 1,
            color: Colors. black54,
          ),
        ],
      ),
    );
  }
}