import 'package:flutter/material.dart';

import '../../Widgets_Padroes.dart' show Custom_Card_Informacao, Custom_TextField_Informacao;
import '../../Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart';


// Paleta de cores da pagina.
const Color corIcones = Colors.deepOrangeAccent;
const Color corCardsTitle = Colors.deepPurpleAccent;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

// Pagina que exibe dados sobre o percurso academico do aluno.
class Aluno_PercursoAcademico extends StatelessWidget {
  const Aluno_PercursoAcademico({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      children: [
        // Campos basicos.
        Custom_TextField_Informacao(descricaoCampo: 'Nº Candidaturas ao ensino superior:', info: dadosAluno['Numero_candidaturas_ES']),
        Custom_Card_Informacao(
          titulo: "ENSINO SECUNDÁRIO:",
          informacoes: infoEnsinoSecundario,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.my_library_books_sharp, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "HABILITAÇÃO ACADÊMICA:",
          informacoes: infoHabAcademica,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.grid_view_outlined, color: corIcones),
        ),
        Custom_Card_Informacao(
          titulo: "PROVENIÊNCIA:",
          informacoes: infoProveniencia,
          corCardTitulo: corCardsTitle,
          icone: const Icon(Icons.trip_origin_sharp, color: corIcones),
        ),
      ],
    );
  }
}


//============================================================================//
// DADOS        DADOS        DADOS            DADOS        DADOS        DADOS
//============================================================================//

/*  Lista de dados sobre o ensino secundario do
*   aluno inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoEnsinoSecundario = [
  Custom_TextField_Informacao(descricaoCampo: 'Número de retenções:',     info: dadosAluno['Numero_retencoes']),
  Custom_TextField_Informacao(descricaoCampo: 'Tipo de estabelecimento:', info: dadosAluno['Tipo_estabelecimento_ES']),
  Custom_TextField_Informacao(descricaoCampo: 'País:',                    info: dadosAluno['Pais_03']),
];

/*  Lista de dados sobre a habilitacao academica
*   do aluno inseridos em TextFields customizados.  */
List<Custom_TextField_Informacao> infoHabAcademica = [
  Custom_TextField_Informacao(descricaoCampo: 'Habilitação anterior:', info: dadosAluno['Habilitacao_anterior']),
  Custom_TextField_Informacao(descricaoCampo: 'Ano conclusão:',        info: dadosAluno['Ano_conclusao']),
  Custom_TextField_Informacao(descricaoCampo: 'País:',                 info: dadosAluno['Pais_03']),
  Custom_TextField_Informacao(descricaoCampo: 'Instituição:',          info: dadosAluno['Instituicao']),
  Custom_TextField_Informacao(descricaoCampo: 'Curso:',                info: dadosAluno['Curso_02']),
];

/*  Lista de dados sobre a proveniencia do
*   aluno inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoProveniencia = [
  Custom_TextField_Informacao(descricaoCampo: 'Instituição:', info: dadosAluno['Instituicao_02']),
];