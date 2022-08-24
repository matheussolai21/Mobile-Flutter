import 'package:app_medico/app/model/medicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddMedico extends StatelessWidget {
  AddMedico({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _crmController = TextEditingController();
  final TextEditingController _especialidadeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Médico"),
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
                    labelText: "Nome da Médico"
                ),
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(mask: "##/##/####")
                ],
                decoration: const InputDecoration(
                    hintText: "Data de Nascimento",
                    labelText: "Data de Nascimento"
                ),
                controller: _dataNascimentoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a data de nascimento';
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [
                  MaskTextInputFormatter(mask: "###.###.###-##")
                ],
                decoration: const InputDecoration(
                    hintText: "CPF da pessoa",
                    labelText: "CPF da pessoa"
                ),
                controller: _cpfController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o ultimo nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Endereço de casa",
                    labelText: "Endereço de casa"
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
                    hintText: "Telefone Medico",
                    labelText: "Telefone Medico"
                ),
                controller: _telefoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o Telefone';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "E-mail do Medico",
                    labelText: "E-mail do Medico"
                ),
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o e-mail';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "CRM do Médico",
                    labelText: "CRM do Médico"
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      //null safety
                      if (_formKey.currentState!.validate()) {
                        Medico medico = Medico(
                            _nameController.text,
                            _dataNascimentoController.text,
                            _cpfController.text,
                            _addressController.text,
                            _telefoneController.text,
                            _emailController.text,
                            _crmController.text,
                            _especialidadeController.text
                        );
                        Navigator.pop(context, medico);
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