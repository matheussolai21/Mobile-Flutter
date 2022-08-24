import 'package:app_medico/app/model/paciente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ViewConsulta extends StatelessWidget {  // ViewPerson({Key? key}) : super(key: key);
  const ViewConsulta(
      this.nome_medico,
      this.crm,
      this.especialidade,
      this.nome_paciente,
      this.numCarteirinha,
      this.dataConsulta,
      this.cpf,
      this.address,
      this.telefone
      );

  // Declare a field that holds the Todo.
  final String nome_medico;
  final String crm;
  final String especialidade;
  final String nome_paciente;
  final String numCarteirinha;
  final String dataConsulta;
  final String cpf;
  final String address;
  final String telefone;


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
                  'Nome do Medico',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen ),
                ),]
          ),
          Row(
              children:[
                Text(
                  '${this.nome_medico}',
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
                  'CRM',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen),
                ),
              ]
          ),
          Row(
              children:[
                Text(
                  '${this.crm}',
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
                  'Especialidade',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen),
                ),
              ]
          ),
          Row(
              children:[
                Text(
                  '${this.especialidade}',
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
              'Nome Paciente',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Colors.lightGreen),
            ),
          ]
          ),
          Row(
              children:[
                Text(
                  '${this.nome_paciente}',
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
              'Numero Carteirinha',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Colors.lightGreen
              ),
            ),
          ]
          ),
          Row(
              children:[
                Text(
                  '${this.numCarteirinha}',
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
            Text('Data da Consulta',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color:Colors.lightGreen
              ),
            ),
          ]
          ),
          Row(
              children:[
                Text(
                  '${this.dataConsulta}',
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
                Text('CPF',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen
                  ),
                ),
              ]
          ),
          Row(
              children:[
                Text(
                  '${this.cpf}',
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
                  'Endereço',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.lightGreen
                  ),
                ),
              ]
          ),
          Row(children:[
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
          Row(
              children:[
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
          ),
          Row(children:[
            Text(
              '${this.telefone}',
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