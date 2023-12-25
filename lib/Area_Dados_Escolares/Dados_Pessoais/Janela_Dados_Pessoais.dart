import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Fontes.dart' show mensagemVoltarInicio;
import '../../Topicos.dart' show Topicos_DrawerAluno;
import '../../Widgets_Padroes.dart';
import '../../Area_Inicial/Paginas_IPT/Janela_Inicial.dart' show Inicio;
import '../Dados_Pessoais/Pagina_Dados.dart' show Aluno_Dados;
import '../Dados_Pessoais/Pagina_Dados_Pais.dart' show Aluno_DadosPais;
import '../Dados_Pessoais/Pagina_Percurso_Academico.dart' show Aluno_PercursoAcademico;


// Dados do aluno.
DocumentSnapshot dadosAluno = DocumentSnapshot as DocumentSnapshot<Object?>;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela sobre os dados pessoais do aluno.  */
class Aluno_DadosPessoais extends StatefulWidget {
  const Aluno_DadosPessoais({super.key, required this.dados});
  final DocumentSnapshot dados;

  @override
  State<Aluno_DadosPessoais> createState() => _Aluno_DadosPessoaisState();
}

class _Aluno_DadosPessoaisState extends State<Aluno_DadosPessoais> {

  // Metodo para configurar os dados do aluno no contexto da janela.
  void atribuirDados(){
    setState(() { dadosAluno = widget.dados; });
  }

  @override
  Widget build(BuildContext context) {
    atribuirDados();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // Exibe uma mensagem antes de sair da pagina.
        final bool sair = await ShowDialog_ConfirmarMensagem(context, mensagemVoltarInicio);
        if (sair) { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Inicio())); }
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: TabBar_TopicosDadosPessoais.length,               // Quantidade de topicos no TabBar.
        child: Scaffold(
          appBar: Custom_AppBar(                                  // AppBar customizavel.
            imagem: "imagens/Foto_IPT.jpg",                       // Imagem de fundo do AppBar.
            tabBar: Custom_TabBar(                                // TabBar customizavel.
                TabBar_TopicosDadosPessoais,
            ),
          ),
          drawer: Custom_Drawer(lstTopicos: Topicos_DrawerAluno), // Drawer customizavel.
          body: const Padding(
            padding: EdgeInsets.all(10.0),
            child: TabBarView_DadosPessoais(),                    // TabBarView configurado.
          ),
        ),
      ),
    );
  }
}


//============================================================================//
// TABBAR       TABBAR       TABBAR          TABBAR       TABBAR       TABBAR
//============================================================================//

/*  Lista de topicos da janela de dados
*   pessoais configuradas em Tabs.  */
List<Tab> TabBar_TopicosDadosPessoais = const [
  Tab(text: "DADOS DO ALUNO",     icon: Icon(Icons.person_sharp,          color: Colors.blueGrey),            iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "PERCURSO ACADÊMICO", icon: Icon(Icons.account_balance_sharp, color: Colors.indigoAccent),        iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "DADOS DOS PAIS",     icon: Icon(Icons.supervisor_account_sharp, color: Colors.deepPurpleAccent), iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
];


/*  WIDGET:
*   TabBarView configurado com a pagina de cada
*   topico do TabBar da janela da dados pessoais.
*/
class TabBarView_DadosPessoais extends StatelessWidget {
  const TabBarView_DadosPessoais({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Aluno_Dados(),
        Aluno_PercursoAcademico(),
        Aluno_DadosPais(),
      ],
    );
  }
}