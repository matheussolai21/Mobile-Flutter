class Consulta {
  int? id;
  final String nome_medico;
  final String crm;
  final String especialidade;
  final String nome_paciente;
  final String numCarteirinha;
  final String dataConsulta;
  final String cpf;
  final String address;
  final String telefone;

  Consulta(this.nome_medico,
         this.crm,
         this.especialidade,
         this.nome_paciente,
         this.numCarteirinha,
         this.dataConsulta,
         this.cpf,
         this.address,
         this.telefone,
         {this.id}
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome_medico': nome_medico,
      'crm': crm,
      'especialidade': especialidade,
      'nome_paciente': nome_paciente,
      'numCarteirinha': numCarteirinha,
      'dataConsulta': dataConsulta,
      'cpf': cpf,
      'address': address,
      'telefone': telefone,
    };
  }
}