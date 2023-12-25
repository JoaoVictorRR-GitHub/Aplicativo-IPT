import 'package:flutter/material.dart';

import '../../Widgets_Padroes.dart' show Custom_Card_Informacao, Custom_TextField_Informacao;
import '../../Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart';


// Paleta de cores da pagina.
const Color corIcones = Colors.deepPurple;
const Color corCardsTitle = Colors.deepOrangeAccent;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

// Pagina que exibe dados sobre o aluno.
class Aluno_Dados extends StatelessWidget {
  const Aluno_Dados({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      children: [
        // Campos basicos.
        Custom_TextField_Informacao(descricaoCampo: 'Curso:',     info: dadosAluno['Curso']),
        Custom_TextField_Informacao(descricaoCampo: 'Nome:',      info: dadosAluno['Nome']),
        Custom_TextField_Informacao(descricaoCampo: 'Nº Cartão:', info: dadosAluno['Numero_cartao']),
        Custom_Card_Informacao(
          titulo: "DADOS PESSOAIS:",
          informacoes: infoPessoal,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.my_library_books_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "DADOS FINANCEIROS:",
          informacoes: infoFinanceiro,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.monetization_on_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "MORADA:",
          informacoes: infoMorada,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.house_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "MORADA SECUNDÁRIA:",
          subtitulo: "Em tempos de aula.",
          informacoes: infoMoradaSecundaria,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.house_outlined, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "CONTATOS:",
          informacoes: infoContatos,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.contacts_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "CONTATO DE EMERGÊNCIA:",
          informacoes: infoContatosEmergencia,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.contact_emergency_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "DADOS PROFISSIONAIS:",
          informacoes: infoProfissional,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.work_sharp, color: corIcones),
        ),
      ],
    );
  }
}


//============================================================================//
// DADOS        DADOS        DADOS            DADOS        DADOS        DADOS
//============================================================================//

/*  Lista de dados passoais sobre o aluno
*   inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoPessoal = [
  Custom_TextField_Informacao(descricaoCampo: 'Data de nascimento:',                       info: dadosAluno['Data_nascimento']),
  Custom_TextField_Informacao(descricaoCampo: 'Gênero:',                                   info: dadosAluno['Genero']),
  Custom_TextField_Informacao(descricaoCampo: 'Estado civil:',                             info: dadosAluno['Estado_Civil']),
  Custom_TextField_Informacao(descricaoCampo: 'Identificação:',                            info: dadosAluno['Identificacao']),
  Custom_TextField_Informacao(descricaoCampo: 'Nº de beneficiário de segurança nacional:', info: dadosAluno['Num_ben_seg_nacional']),
  Custom_TextField_Informacao(descricaoCampo: '1ª Nacionalidade:',                         info: dadosAluno['Nacionalidade']),
  Custom_TextField_Informacao(descricaoCampo: '2ª Nacionalidade:',                         info: dadosAluno['Nacionalidade_02']),
];

/*  Lista de dados financeiros do aluno
*   inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoFinanceiro = [
  Custom_TextField_Informacao(descricaoCampo: 'Dados fiscais:',              info: dadosAluno['Dados_fiscais']),
  Custom_TextField_Informacao(descricaoCampo: 'País fiscal:',                info: dadosAluno['Pais_fiscal']),
  Custom_TextField_Informacao(descricaoCampo: 'Nº de identificação fiscal:', info: dadosAluno['Num_ident_fiscal']),
  Custom_TextField_Informacao(descricaoCampo: 'NIB:',                        info: dadosAluno['NIB']),
  Custom_TextField_Informacao(descricaoCampo: 'IBAN:',                       info: dadosAluno['IBAN']),
  Custom_TextField_Informacao(descricaoCampo: 'BIC/SWIFT:',                  info: dadosAluno['BIC_SWIFT']),
];

/*  Lista de dados sobre a morada do aluno
*   inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoMorada = [
  Custom_TextField_Informacao(descricaoCampo: 'Morada:',                              info: dadosAluno['Morada']),
  Custom_TextField_Informacao(descricaoCampo: 'País:',                                info: dadosAluno['Pais']),
  Custom_TextField_Informacao(descricaoCampo: 'Código postal:',                       info: dadosAluno['Codigo_postal']),
  Custom_TextField_Informacao(descricaoCampo: 'Número de irmãos:',                    info: dadosAluno['Num_irmaos']),
  Custom_TextField_Informacao(descricaoCampo: 'Nº de pessoas no agregado familiar:',  info: dadosAluno['Agregado_familiar']),
  Custom_TextField_Informacao(descricaoCampo: 'Deslocado da residência permanente ?', info: dadosAluno['Deslocado_res_permanente']),
];

/*  Lista de dados sobre a segunda morada do
*   aluno inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoMoradaSecundaria = [
  // Campos.
  Custom_TextField_Informacao(descricaoCampo: 'Morada desconhecida ?',                 info: dadosAluno['Morada_desconhecida']),
  Custom_TextField_Informacao(descricaoCampo: 'Morada:',                               info: dadosAluno['Morada_02']),
  Custom_TextField_Informacao(descricaoCampo: 'País:',                                 info: dadosAluno['Pais_02']),
  Custom_TextField_Informacao(descricaoCampo: 'Código postal:',                        info: dadosAluno['Codigo_postal_02']),
  Custom_TextField_Informacao(descricaoCampo: 'Morada para receber correspondências:', info: dadosAluno['Morada_correspondencia']),
];

/*  Lista de dados sobre os contatos
*   do aluno inseridos em TextFields
*   customizados. */
List<Custom_TextField_Informacao> infoContatos = [
  Custom_TextField_Informacao(descricaoCampo: 'Telefone principal:',  info: dadosAluno['Telefone_principal']),
  Custom_TextField_Informacao(descricaoCampo: 'Telefone secundário:', info: dadosAluno['Telefone_secundario']),
  Custom_TextField_Informacao(descricaoCampo: 'Telemóvel:',           info: dadosAluno['Telemovel']),
  Custom_TextField_Informacao(descricaoCampo: 'Email:',               info: dadosAluno['Email']),
];

/*  Lista de dados sobre os contatos
*   de emergencia do aluno inseridos
*   em TextFields customizados. */
List<Custom_TextField_Informacao> infoContatosEmergencia = [
  Custom_TextField_Informacao(descricaoCampo: 'Nome de emergência:',   info: dadosAluno['Nome_emergencia']),
  Custom_TextField_Informacao(descricaoCampo: 'Parentesco:',           info: dadosAluno['Parentesco']),
  Custom_TextField_Informacao(descricaoCampo: 'Número de emergência:', info: dadosAluno['Numero_emergencia']),
];

/*  Lista de dados profissionais do aluno
*   inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoProfissional = [
  Custom_TextField_Informacao(descricaoCampo: 'Grupo profissional:',    info: dadosAluno['Grupo_profissional']),
  Custom_TextField_Informacao(descricaoCampo: 'Profissão:',             info: dadosAluno['Profissao']),
  Custom_TextField_Informacao(descricaoCampo: 'Situação profissional:', info: dadosAluno['Situacao_profissional']),
];