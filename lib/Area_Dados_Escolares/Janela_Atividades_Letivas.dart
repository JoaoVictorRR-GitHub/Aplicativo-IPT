import 'package:flutter/material.dart';

import '../Fontes.dart' show mensagemVoltarDadosEscolares;
import '../Topicos.dart';
import '../Widgets_Padroes.dart';
import '../Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart';


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela sobre os topicos
*   de atividades letivas.  */
class Aluno_AtividadesLetivas extends StatelessWidget {
  const Aluno_AtividadesLetivas({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // Exibe uma mensagem antes de sair da pagina.
        final bool sair = await ShowDialog_ConfirmarMensagem(context, mensagemVoltarDadosEscolares);
        if (sair) { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Aluno_DadosPessoais(dados: dadosAluno))); }
      },
      child: Scaffold(
        appBar: const Custom_AppBar(imagem: "imagens/Foto_IPT.jpg"),  // AppBar customizavel.
        drawer: Custom_Drawer(lstTopicos: Topicos_DrawerAluno),       // Drawer customizavel.
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Custom_GridView_Topicos(                             // GridView customizavel.
            lstTopicos: SubTopicos_AtividadesLetivas,                 // Topicos configurados.
            substituirPagina: false,                                  // Inidica que o link os itens no Grid mantem a pagina atual na rota.
          ),
        ),
        bottomSheet: const Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 50.0),
          child: PainelPersonalizado(), // Painel personalizado.
        ),
      ),
    );
  }
}