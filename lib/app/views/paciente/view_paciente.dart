import 'package:app_medico/app/model/paciente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ViewPaciente extends StatelessWidget {
  // ViewPerson({Key? key}) : super(key: key);
  const ViewPaciente(
        this.name,
        this.date,
        this.cpf,
        this.address,
        this.telefone,
        this.email,
        this.convenio,
        this.numCarteirinha
  );

  // Declare a field that holds the Todo.
  final String name;
  final String date;
  final String cpf;
  final String address;
  final String telefone;
  final String email;
  final String convenio;
  final String numCarteirinha;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados')),
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0,top: 10.0),
        child: Column(children: <Widget>[
          Row(
              children:[
                Text(
                  'Nome Paciente',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen ),
                ),]
          ),// Nome
          Row(
              children:[
                Text(
                  '${this.name}',
                  style: TextStyle(
                      fontSize: 20
                  ),
                ) ,
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              children:[
                Text(
                  'Data de Nascimento',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen),
                ),
              ]
          ),// Data de Nascimento
          Row(
              children:[
                Text(
                  '${this.date}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20),
                ),
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              children:[
                Text(
                  'CPF',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen),
                ),
              ]
          ),//CPF
          Row(
              children:[
                Text(
                  '${this.cpf}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20),
                ),
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(children:[
            Text(
              'Endereço',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Colors.lightGreen),
            ),
          ]
          ),//Endereço
          Row(
              children:[
                Text(
                  '${this.address}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(children:[
            Text(
              'Telefone',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Colors.lightGreen
              ),
            ),
          ]
          ),//Telefone
          Row(
              children:[
                Text(
                  '${this.telefone}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(children:[
            Text('E-mail',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Colors.lightGreen
              ),
            ),
          ]
          ),//E-MAIL
          Row(
              children:[
                Text(
                  '${this.email}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              children:[
                Text('Convenio',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen
                  ),
                ),
              ]
          ),//Convenio
          Row(
              children:[
                Text(
                  '${this.convenio}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ]
          ),
          SizedBox(
            height: 20,
          ),
          Row(
              children:[
                Text(
                  'Número Carteirinha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen
                  ),
                ),
              ]
          ),//Numero Carteirinha
          Row(children:[
            Text(
              '${this.numCarteirinha}',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20
              ),
            ),
          ]
          ),
        ]),
      ),
    );
  }
}