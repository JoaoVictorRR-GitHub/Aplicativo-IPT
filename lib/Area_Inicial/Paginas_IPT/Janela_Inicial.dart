import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Topicos.dart';
import '../../Fontes.dart' show mensagemSairAplicativo;
import '../../Widgets_Padroes.dart';
import '../Paginas_IPT/Pagina_Home.dart' show Home;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela inicial do aplicativo. */
class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // Exibe uma mensagem antes de sair da pagina.
        final bool sair = await ShowDialog_ConfirmarMensagem(context, mensagemSairAplicativo);
        if (sair) { SystemNavigator.pop(); }  // Encerra o aplicativo.
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: TabBar_TopicosInicio.length,                  // Quantidade de topicos no TabBar.
        child: Scaffold(
          appBar: Custom_AppBar(                              // AppBar customizavel.
            tabBar: Custom_TabBar(                            // TabBar customizavel.
              TabBar_TopicosInicio,
            ),
          ),
          drawer: Custom_Drawer(lstTopicos: Topicos_Drawer),  // Drawer customizavel.
          body: const Padding(
            padding: EdgeInsets.all(10.0),
            child: TabBarView_Inicio(),                       // TabBarView configurado.
          ),
        ),
      ),
    );
  }
}


//============================================================================//
// TABBAR       TABBAR       TABBAR          TABBAR       TABBAR       TABBAR
//============================================================================//

/*  Lista de topicos da janela inicial do
*   Aplicativo IPT configuradas em Tabs.  */
const List<Tab> TabBar_TopicosInicio = [
  Tab(text: "HOME",          icon: Icon(Icons.article_sharp,          color: Colors.yellowAccent),  iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "CANDIDATURAS",  icon: Icon(Icons.app_registration_sharp, color: Colors.blue),          iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "IPT",           icon: Icon(Icons.account_balance_sharp,  color: Colors.redAccent),     iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "ENSINO",        icon: Icon(Icons.school_sharp,           color: Colors.blueGrey),      iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "COMUNIDADE",    icon: Icon(Icons.groups_sharp,           color: Colors.yellowAccent),  iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "INVESTIGAÇÃO",  icon: Icon(Icons.search_sharp,           color: Colors.black45),       iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "INTERNACIONAL", icon: Icon(Icons.flag_sharp,             color: Colors.pinkAccent),    iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
  Tab(text: "VIDA NO IPT",   icon: Icon(Icons.house_sharp,            color: Colors.limeAccent),    iconMargin: EdgeInsets.only(bottom: 10, left: 30, right: 30)),
];


/*  WIDGET:
*   TabBarView configurado com a pagina de
*   cada topico do TabBar da janela inicial.
*/
class TabBarView_Inicio extends StatelessWidget {
  const TabBarView_Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        const Home(),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_IPT),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_IPT),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_Ensino),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_Comunidade),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_Investigacao),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_Internacional),
        Custom_GridView_Topicos(lstTopicos: SubTopicos_VidaIPT),
      ],
    );
  }
}