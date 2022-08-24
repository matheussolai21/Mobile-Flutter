class Paciente {
  int? id;
  final String name;
  final String dataNascimento;
  final String cpf;
  final String address;
  final String telefone;
  final String email;
  final String convenio;
  final String numCarteirinha;

  Paciente(this.name,
         this.dataNascimento,
         this.cpf,
         this.address,
         this.telefone,
         this.email,
         this.convenio,
         this.numCarteirinha,
         {this.id}
  );

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'dataNascimento': this.dataNascimento,
      'cpf': this.cpf,
      'address': this.address,
      'telefone': this.telefone,
      'email': this.email,
      'convenio': this.convenio,
      'numCarteirinha': this.numCarteirinha,
    };
  }
}