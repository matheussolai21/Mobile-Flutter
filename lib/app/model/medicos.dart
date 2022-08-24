class Medico {
  int? id;
  final String nome_medico;
  final String dataNascimento;
  final String cpf;
  final String address;
  final String telefone;
  final String email;
  final String crm;
  final String especialidade;

  Medico(this.nome_medico,
         this.dataNascimento,
         this.cpf,
         this.address,
         this.telefone,
         this.email,
         this.crm,
         this.especialidade,
         {this.id}
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome_medico': nome_medico,
      'dataNascimento': dataNascimento,
      'cpf': cpf,
      'address': address,
      'telefone': telefone,
      'email': email,
      'crm': crm,
      'especialidade': especialidade,
    };
  }
}