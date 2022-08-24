import 'package:app_medico/app/model/paciente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddPaciente extends StatelessWidget {
  AddPaciente({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _convenioController = TextEditingController();
  final TextEditingController _numCarteirinhaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Paciente"),
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
                    hintText: "Nome da pessoa",
                    labelText: "Nome da pessoa"
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
                    labelText: "CPF da pesa"
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
                    hintText: "Telefone Paciente",
                    labelText: "Telefone Paciente"
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
                    hintText: "E-mail do paciente",
                    labelText: "E-mail do paciente"
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
                    hintText: "Convênio do paciente",
                    labelText: "Convênio do paciente"
                ),
                controller: _convenioController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o Convênio';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Número da carteirinha",
                    labelText: "Número da carteirinha"
                ),
                controller: _numCarteirinhaController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o Número';
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
                        Paciente person = Paciente(
                            _nameController.text,
                            _dataNascimentoController.text,
                            _cpfController.text,
                            _addressController.text,
                            _telefoneController.text,
                            _emailController.text,
                            _convenioController.text,
                            _numCarteirinhaController.text
                        );
                        Navigator.pop(context, person);
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
