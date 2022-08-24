import 'package:app_medico/app/model/consulta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddConsulta extends StatelessWidget {
  AddConsulta({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeMedicoController = TextEditingController();
  final TextEditingController _crmController = TextEditingController();
  final TextEditingController _especialidadeController = TextEditingController();
  final TextEditingController _nomePacienteController = TextEditingController();
  final TextEditingController _numCarteirinhaController = TextEditingController();
  final TextEditingController _dataConsultaController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Consulta"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome do Médico",
                    labelText: "Nome do Médico"
                ),
                controller: _nomeMedicoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "CRM",
                    labelText: "CRM"
                ),
                controller: _crmController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o CRM';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Especialidade",
                    labelText: "Especialidade"
                ),
                controller: _especialidadeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a especialidade';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome Paciente",
                    labelText: "Nome Paciente"
                ),
                controller: _nomePacienteController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Número Convênio",
                    labelText: "Número Convênio"
                ),
                controller: _numCarteirinhaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o número';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(mask: "##/##/####")
                ],
                decoration: const InputDecoration(
                    hintText: "Data da Consulta",
                    labelText: "Data da Consulta"
                ),
                controller: _dataConsultaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a data';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(mask: "###.###.###-##")
                ],
                decoration: const InputDecoration(
                    hintText: "CPF",
                    labelText: "CPF"
                ),
                controller: _cpfController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o CPF';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Insira o endereço",
                    labelText: "Insira o endereço"
                ),
                controller: _addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o endereço';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(mask: "(##)#####-####")
                ],
                decoration: const InputDecoration(
                    hintText: "Insira o telefone",
                    labelText: "Insira o telefone"
                ),
                controller: _telefoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o telefone';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      //null safety
                      if (_formKey.currentState!.validate()) {
                        Consulta consulta = Consulta(
                            _nomeMedicoController.text,
                            _crmController.text,
                            _especialidadeController.text,
                            _nomePacienteController.text,
                            _numCarteirinhaController.text,
                            _dataConsultaController.text,
                            _cpfController.text,
                            _addressController.text,
                            _telefoneController.text
                        );
                        Navigator.pop(context, consulta);
                      }
                    },
                    child: const Text('Salvar')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}