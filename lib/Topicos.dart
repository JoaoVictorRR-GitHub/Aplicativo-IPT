import 'package:flutter/material.dart';

import 'Fontes.dart' show styleSubTopicos;
import 'WebView_URLs.dart';
import 'Area_Inicial/Janela_Login.dart';
import 'Area_Inicial/Janela_Refeitorio.dart';
import 'Area_Inicial/Paginas_IPT/Janela_Inicial.dart' show Inicio;
import 'Area_Dados_Escolares/Janela_Consultas.dart';
import 'Area_Dados_Escolares/Janela_Atividades_Letivas.dart';
import 'Area_Dados_Escolares/Janela_Situacao_Financeira.dart';
import 'Area_Dados_Escolares/Janela_Atividades_nao_Letivas.dart';
import 'Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart';


//============================================================================//
// CLASSE TOPICOS      CLASSE TOPICOS      CLASSE TOPICOS      CLASSE TOPICOS
//============================================================================//

/*  CLASSE:
*   Classe para criacao de topicos com
*   icone e pagina de direcionamento
*   para Web ou paginas do aplicativo.
*/
class Topicos {
  String topico;  // Nome do topico.
  Icon icone;     // Icone que representa o topico.
  Widget pagina;  // Pagina para onde o topico ira levar.

  Topicos(this.topico, this.icone, this.pagina);
}


//============================================================================//
// GRIDVIEW TOPICOS   GRIDVIEW TOPICOS    GRIDVIEW TOPICOS   GRIDVIEW TOPICOS
//============================================================================//

/*  WIDGET:
*   GridView personalizado para exibir uma lista de
*   topicos, que direcionam o utilizador para outra
*   pagina, em um grid (Topicos customizaveis).
*/
class Custom_GridView_Topicos extends StatelessWidget {
  const Custom_GridView_Topicos({super.key, required this.lstTopicos, this.substituirPagina = true});

  final List<Topicos> lstTopicos; // Lista de topicos do GridView.
  final bool substituirPagina;    // Indica como a pagina do topico sera chamada (push() = false ou pushReplacement() = true).

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,  // Numero de colunas do GridView.
      children: List.generate(lstTopicos.length, (index){
        return GestureDetector(
          onTap: () {
            // Redirecionamento para a pagina do topico quando clicado.
            substituirPagina ?
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lstTopicos[index].pagina))
                : Navigator.push(context, MaterialPageRoute(builder: (context) => lstTopicos[index].pagina));
          },
          // Personalizacao dos itens do GridView.
          child: Card(
            elevation: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                lstTopicos[index].icone,
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(lstTopicos[index].topico, style: styleSubTopicos, textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}


//============================================================================//
// TOPICOS DDRAWERS   TOPICOS DDRAWERS    TOPICOS DDRAWERS   TOPICOS DDRAWERS
//============================================================================//

/*  Lista de topicos que aparecem
*   no Drawer da area inicial.  */
List<Topicos> Topicos_Drawer = [
  Topicos("HOME",            const Icon(Icons.article_sharp,          color: Colors.grey),       const Inicio()),
  Topicos("REFEITÓRIO",      const Icon(Icons.restaurant_sharp,       color: Colors.deepOrange), const RefeitorioIPT()),
  Topicos("DADOS ESCOLARES", const Icon(Icons.my_library_books_sharp, color: Colors.blueGrey),   const LoginIPT()),
];

/*  Lista de topicos que aparecem no
*   Drawer da area de dados escolares.  */
List<Topicos> Topicos_DrawerAluno = [
  Topicos("DADOS PESSOAIS",         const Icon(Icons.account_circle_sharp,       color: Colors.blueGrey),         Aluno_DadosPessoais(dados: dadosAluno)),
  Topicos("SITUAÇÃO FINANCEIRA",    const Icon(Icons.monetization_on_sharp,      color: Colors.deepOrangeAccent), const Aluno_SituacaoFinanceira()),
  Topicos("CONSULTAS",              const Icon(Icons.content_paste_search_sharp, color: Colors.deepPurpleAccent), const Aluno_Consultas()),
  Topicos("ATIVIDADES LETIVAS",     const Icon(Icons.pages_rounded,              color: Colors.lightBlue),        const Aluno_AtividadesLetivas()),
  Topicos("ATIVIDADES NÃO LETIVAS", const Icon(Icons.pages_rounded,              color: Colors.lightGreen),       const Aluno_AtividadesNaoLetivas()),
  Topicos("VOLTAR",                 const Icon(Icons.arrow_circle_left_sharp,    color: Colors.black54),          const Inicio()),
];


//============================================================================//
// SUBTOPICOS DE DADOS ESCOLARES                SUBTOPICOS DE DADOS ESCOLARES
//============================================================================//

/*  Lista de topicos de consultas sobre o curso do aluno. */
List<Topicos> SubTopicos_Consulta = [
  Topicos("PLANOS DE ESTUDO",             const Icon(Icons.menu_book,           color: Colors.blue),        WebViewApp(webSite: sitePlanosEstudo)),
  Topicos("SITUAÇÃO CURRICULAR",          const Icon(Icons.library_books_sharp, color: Colors.redAccent),   WebViewApp(webSite: siteSituacaoCurricular)),
  Topicos("MINHAS UNIDADES CURRICULARES", const Icon(Icons.text_increase_sharp, color: Colors.lightGreen),  WebViewApp(webSite: siteUnidadesCurriculares)),
  Topicos("BOLSA",                        const Icon(Icons.shopping_bag_sharp,  color: Colors.amber),       WebViewApp(webSite: siteBolsas)),
  Topicos("CALENDÁRIO DE EXAMES",         const Icon(Icons.text_snippet_sharp,  color: Colors.blueGrey),    WebViewApp(webSite: siteExames)),
  Topicos("FALTAS",                       const Icon(Icons.text_decrease_sharp, color: Colors.blueGrey),    WebViewApp(webSite: siteFaltas)),
];

/*  Lista de topicos de atividades letivas. */
List<Topicos> SubTopicos_AtividadesLetivas = [
  Topicos("MATRÍCULA",              const Icon(Icons.playlist_add_check_circle_sharp, color: Colors.blue),        WebViewApp(webSite: siteMatricula)),
  Topicos("FORMAÇÃO AVANÇADA",      const Icon(Icons.school_sharp,                    color: Colors.redAccent),   WebViewApp(webSite: siteFormacaoAvancada)),
  Topicos("ESTÁGIO",                const Icon(Icons.work_history_sharp,              color: Colors.lightGreen),  WebViewApp(webSite: siteEstagio)),
  Topicos("INSCRIÇÃO A EXAMES",     const Icon(Icons.pending_actions_sharp,           color: Colors.amber),       WebViewApp(webSite: siteInscricaoExames)),
  Topicos("REVISÃO DE NOTAS",       const Icon(Icons.rate_review_sharp,               color: Colors.blueGrey),    WebViewApp(webSite: siteRevisaoNotas)),
  Topicos("REQUISITAR DOCUMENTOS",  const Icon(Icons.document_scanner_sharp,          color: Colors.blueGrey),    WebViewApp(webSite: siteRequisitarDocs)),
];

/*  Lista de topicos de atividades nao letivas. */
List<Topicos> SubTopicos_AtividadesNaoLetivas = [
  Topicos("ATIVIDADES CURRICULARES",    const Icon(Icons.assignment_turned_in_sharp,  color: Colors.blue),        WebViewApp(webSite: siteAtividadesCurriculares)),
  Topicos("EXTRA CURRICULARES",         const Icon(Icons.run_circle_sharp,            color: Colors.redAccent),   WebViewApp(webSite: siteAtividadaeNaoCurriculares)),
  Topicos("COMPETÊNCIAS LINGUÍSTICAS",  const Icon(Icons.language_sharp,              color: Colors.lightGreen),  WebViewApp(webSite: siteCompetenciasLinguisticas)),
];


//============================================================================//
// SUBTOPICOS DO IPT (JANELA INICIAL)      SUBTOPICOS DO IPT (JANELA INICIAL)
//============================================================================//

/*  Lista de topicos sobre o IPT. */
List<Topicos> SubTopicos_IPT = [
  Topicos("HISTÓRIA",            const Icon(Icons.history_edu_sharp,    color: Colors.blue),             const Inicio()),
  Topicos("GOVERNAÇÃO",          const Icon(Icons.gavel_sharp,          color: Colors.redAccent),        const Inicio()),
  Topicos("ESCOLAS E UDS",       const Icon(Icons.maps_home_work_sharp, color: Colors.lightGreenAccent), const Inicio()),
  Topicos("SERVIÇOS E UNIDADES", const Icon(Icons.account_tree_sharp,   color: Colors.blueGrey),         const Inicio()),
];

/*  Lista de topicos sobre o ensino no IPT. */
List<Topicos> SubTopicos_Ensino = [
  Topicos("CURSOS",               const Icon(Icons.collections_bookmark_sharp, color: Colors.blue),             const Inicio()),
  Topicos("OUTRA FORMAÇÃO",       const Icon(Icons.dashboard_sharp,            color: Colors.redAccent),        const Inicio()),
  Topicos("INFORMAÇÃO ACADÊMICA", const Icon(Icons.content_paste_sharp,        color: Colors.lightGreenAccent), const Inicio()),
  Topicos("BALCÃO ÚNICO/SPOC",    const Icon(Icons.interests_sharp,            color: Colors.blueGrey),         const Inicio()),
];

/*  Lista de topicos sobre a comunidade do IPT. */
List<Topicos> SubTopicos_Comunidade = [
  Topicos("ESTUDANTES", const Icon(Icons.account_circle_sharp, color: Colors.blue),             const Inicio()),
  Topicos("DOCENTES",   const Icon(Icons.switch_account_sharp, color: Colors.redAccent),        const Inicio()),
  Topicos("STAFF",      const Icon(Icons.support_agent_sharp,  color: Colors.blueGrey),         const Inicio()),
  Topicos("@EUSOUIPT",  const Icon(Icons.favorite_sharp,       color: Colors.lightGreenAccent), const Inicio()),
];

/*  Lista de topicos sobre o ambiente do IPT. */
List<Topicos> SubTopicos_Investigacao = [
  Topicos("LABORATORIO CENTRAL",           const Icon(Icons.science_rounded,     color: Colors.blue),             const Inicio()),
  Topicos("CENTRO DE INVESTIGAÇÃO FCT",    const Icon(Icons.local_library_sharp, color: Colors.redAccent),        const Inicio()),
  Topicos("CENTROS E LABORATÓRIOS DO IPT", const Icon(Icons.location_on_sharp,   color: Colors.lightGreenAccent), const Inicio()),
  Topicos("OUTRAS ESTRUTURAS",             const Icon(Icons.dashboard_sharp,     color: Colors.blueGrey),         const Inicio()),
];

/*  Lista de topicos sobre assuntos internacionais no IPT.  */
List<Topicos> SubTopicos_Internacional = [
  Topicos("ESTUDANTE INTERNACIONAL",  const Icon(Icons.flag_sharp,           color: Colors.blue),             const Inicio()),
  Topicos("MOBILIDADE",               const Icon(Icons.flight_land_sharp,    color: Colors.redAccent),        const Inicio()),
  Topicos("GAB. REL. INTERNACIONAIS", const Icon(Icons.travel_explore_sharp, color: Colors.lightGreenAccent), const Inicio()),
  Topicos("ERASMUS STUDENT NETWORK ", const Icon(Icons.stream_sharp,         color: Colors.blueGrey),         const Inicio()),
];

/*  Lista de topicos sobre a vida no IPT. */
List<Topicos> SubTopicos_VidaIPT = [
  Topicos("CULTURA E DESPORTO",       const Icon(Icons.volunteer_activism_sharp, color: Colors.lightGreenAccent), const Inicio()),
  Topicos("ALIMENTAÇÃO E ALOJAMENTO", const Icon(Icons.food_bank_sharp,          color: Colors.redAccent),        const Inicio()),
  Topicos("ASSOCIATIVISMO",           const Icon(Icons.groups_sharp,             color: Colors.blueGrey),         const Inicio()),
  Topicos("MEDIO TEJO",               const Icon(Icons.local_activity_sharp,     color: Colors.blue),             const Inicio()),
];