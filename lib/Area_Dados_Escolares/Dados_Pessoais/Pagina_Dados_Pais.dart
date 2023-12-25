import 'package:flutter/material.dart';

import '../../Widgets_Padroes.dart' show Custom_Card_Informacao, Custom_TextField_Informacao;
import '../../Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart';


// Paleta de cores da pagina.
const Color corIcones = Colors.deepOrangeAccent;
const Color corCardsTitle = Colors.indigoAccent;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

// Pagina que exibe dados sobre os pais do aluno.
class Aluno_DadosPais extends StatelessWidget {
  const Aluno_DadosPais({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      children: [
        Custom_Card_Informacao(
          titulo: "MÃE:",
          margemTopo: false,
          informacoes: infoMae,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.family_restroom_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "PAI:",
          informacoes: infoPai,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.family_restroom_sharp, color: corIcones),
        ),
      ],
    );
  }
}


//============================================================================//
// DADOS        DADOS        DADOS            DADOS        DADOS        DADOS
//============================================================================//

const String campoNome      = "Nome:";
const String campoGrupo     = "Grupo profissional:";
const String campoProfissao = "Profissão:";
const String campoSitProf   = "Situação profissional:";
const String campoHabAcad   = "Habilitação acadêmica:";


/*  Lista de dados sobre a mae do aluno
*   inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoMae = [
  Custom_TextField_Informacao(descricaoCampo: campoNome,      info: dadosAluno['Nome_mae']),
  Custom_TextField_Informacao(descricaoCampo: campoGrupo,     info: dadosAluno['Grupo_profissional_mae']),
  Custom_TextField_Informacao(descricaoCampo: campoProfissao, info: dadosAluno['Profissao_mae']),
  Custom_TextField_Informacao(descricaoCampo: campoSitProf,   info: dadosAluno['Situacao_profissional_mae']),
  Custom_TextField_Informacao(descricaoCampo: campoHabAcad,   info: dadosAluno['Habilitacao_academica_mae']),
];

/*  Lista de dados sobre o pai do aluno
*   inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoPai = [
  Custom_TextField_Informacao(descricaoCampo: campoNome,      info: dadosAluno['Nome_pai']),
  Custom_TextField_Informacao(descricaoCampo: campoGrupo,     info: dadosAluno['Grupo_profissional_pai']),
  Custom_TextField_Informacao(descricaoCampo: campoProfissao, info: dadosAluno['Profissao_pai']),
  Custom_TextField_Informacao(descricaoCampo: campoSitProf,   info: dadosAluno['Situacao_profissional_pai']),
  Custom_TextField_Informacao(descricaoCampo: campoHabAcad,   info: dadosAluno['Habilitacao_academica_pai']),
];