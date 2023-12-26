import 'package:flutter/material.dart';

import 'Sobre.dart';
import 'Fontes.dart';
import 'Topicos.dart';


//============================================================================//
// APPBAR PERSONALIZADO       APPBAR PERSONALIZADO       APPBAR PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   AppBar personalizado para a utilizacao em
*   varias janelas (Imagem e TabBar customizavel).
*/
class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_AppBar({super.key, this.imagem, this.tabBar});

  final String? imagem; // Imagem de fundo do AppBar.
  final TabBar? tabBar; // TabBar do AppBar.

  @override
  Size get preferredSize => tabBar != null ? const Size.fromHeight(165) // Tamanho do AppBar com TabBar.
      : const Size.fromHeight(85);  // Tamanho do AppBar sem TabBar.

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 20,
      toolbarHeight: 85,                    // Altura do bottom do AppBar.
      backgroundColor: Colors.lightGreen,   // Cor de fundo.
      leading: Builder(                     // Customizacao do icone do drawer.
        builder: (context) => IconButton(
          color: Colors.lightGreen,
          padding: const EdgeInsets.only(top: 30.0, left: 20.0),
          onPressed: () => Scaffold.of(context).openDrawer(), // Abre o drawer.
          icon: const Icon(Icons.menu_sharp, size: 40),
        ),
      ),
      // title:
      flexibleSpace:
      // GestureDetector(
      //   onTap: () {
      //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Inicio()));
      //   }, child:
        imagem != null ? Image.asset(imagem!, fit: BoxFit.fill, height: 115) : Image.asset("imagens/Logo_IPT.jpg", fit: BoxFit.fill),
      // ),
      bottom: tabBar, // TabBar customizado.
    );
  }
}


//============================================================================//
// TABBAR PERSONALIZADO       TABBAR PERSONALIZADO       TABBAR PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   TabBar personalizado para a utilizacao em
*   varias janelas (Topicos customizaveis).
*/
TabBar Custom_TabBar(List<Tab> tabBarTopicos) {
  return TabBar(
    indicatorWeight: 8,                                               // Altura do indicador de pagina selecionada.
    isScrollable: true,                                               // Indica se o TabBar pode rolar na horizontal.
    labelStyle: styleTopicos,                                         // Estilo da fonte do texto.
    labelColor: Colors.white,                                         // Cor do tab selecionado.
    unselectedLabelColor: Colors.white60,                             // Cor dos tabs nao selecionados.
    indicatorColor: Colors.deepOrangeAccent,                          // Cor do indicador do tab.
    overlayColor: const MaterialStatePropertyAll(Colors.limeAccent),  // Cor ao selecionador um tab.
    splashBorderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)), // Estilo da borda ao selecionar um tab.
    tabs: tabBarTopicos,  // Lista topicos do TabBar.
  );
}


//============================================================================//
// DRAWER PERSONALIZADO       DRAWER PERSONALIZADO       DRAWER PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   Drawer personalizdo para a utilizacao em
*   varias janelas (Topicos customizaveis).
*/
class Custom_Drawer extends StatelessWidget {
  const Custom_Drawer({super.key, required this.lstTopicos});

  final List<Topicos> lstTopicos; // Lista de topicos do Drawer.

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white60,  // Cor de fundo do Drawer.
      child: ListView(
        children: [
          GestureDetector(
            onTap: () { Navigator.pop(context); },  // Fecha o Drawer ao clicar no header.
            child: DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("imagens/Foto_IPT.jpg"), fit: BoxFit.fill),                  // Imagem de fundo do header do Drawer.
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Image.asset("imagens/Logo_IPT.png", fit: BoxFit.fitWidth, filterQuality: FilterQuality.high),  // Imagem do header.
              ),
            ),
          ),
          ListView.builder(
            // Listagem dos topicos no drawer.
            shrinkWrap: true, // Permite o scroll vertical.
            itemCount: lstTopicos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Redirecionamento para a pagina do topico quando clicado.
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => lstTopicos[index].pagina));
                },
                // Personalizacao dos itens do Drawer.
                child: Card(
                  child: ListTile(
                    leading: lstTopicos[index].icone,
                    title: Text(lstTopicos[index].topico, style: styleTopicos),
                  ),
                ),
              );
            },
          ),
          const Card(
            child: Info_Aplicativo(), // Informacoes sobre o aplicativo.
          ),
        ],
      ),
    );
  }
}


//============================================================================//
// CARD PERSONALIZADO          CARD PERSONALIZADO          CARD PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   Card personalizado com uma mensagem
*   para a utilizacao em varias janelas.
*/
class PainelPersonalizado extends StatelessWidget {
  const PainelPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Card(
        color: Colors.black38,
        margin: EdgeInsets.all(10),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          titleAlignment: ListTileTitleAlignment.center,
          title: Icon(Icons.dashboard_outlined, size: 50, color: Colors.deepOrangeAccent),
          subtitle: Text('CLIQUE PARA VER MAIS DETALHES', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.lightGreen)),
        ),
      ),
    );
  }
}


//============================================================================//
// TEXTFIELD PERSONALIZADO  TEXTFIELD  PERSONALIZADO  TEXTFIELD PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   TextField peersonalizado para exibir uma
*   informacao (Descricao e info customizaveis).
*/
class Custom_TextField_Informacao extends StatefulWidget {
  const Custom_TextField_Informacao({super.key, required this.descricaoCampo, required this.info});

  final String descricaoCampo;  // Descricao do campo TextField.
  final String info;            // Informacao a ser exibida no campo.

  @override
  State<Custom_TextField_Informacao> createState() => _Custom_TextField_InformacaoState();
}

class _Custom_TextField_InformacaoState extends State<Custom_TextField_Informacao> {

  TextEditingController refCampo = TextEditingController(); // Controlador/Referencia do campo.

  void inserirInformacao() {  // Metodo para inserir a informacao no campo.
    setState(() { refCampo.text = widget.info; });
  }

  @override
  Widget build(BuildContext context) {
    inserirInformacao();
    return TextField(
      enabled: false,               // Desabilita o campo para inputs.
      controller: refCampo,         // Controlador/Referencia do campo.
      textAlign: TextAlign.right,   // Alinhamento da informacao no campo.
      style: styleBold,             // Estilo do texto no campo.
      decoration: InputDecoration(
        // prefixText: widget.descricaoCampo, // Exibe a descricao do campo (So aparece quando existe alguma informacao).
        // prefixStyle: styleField,
        prefixIcon: Text(widget.descricaoCampo, style: styleBold),              // Exibe a descricao do campo.
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0), // Alinhamento da descricao do campo.
      ),
    );
  }
}


//============================================================================//
// CARD PERSONALIZADO          CARD PERSONALIZADO          CARD PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   Card personalizado para exibir informacoes
*   (Icone, titulo, subtitulo, informacoes, cores
*   e margem do topo customizaveis).
*/
class Custom_Card_Informacao extends StatelessWidget {
  const Custom_Card_Informacao({super.key,
    this.icone          = const Icon(Icons.grain_sharp,  color: Colors.deepOrangeAccent),
    this.titulo         = "TÍTULO",
    this.subtitulo,
    this.corCard        = Colors.white60,
    this.corCardTitulo  = Colors.deepPurpleAccent,
    this.margemTopo     = true,
    required this.informacoes,
  });

  final Icon icone;           // Icone do card.
  final String titulo;        // Titulo do card.
  final String? subtitulo;    // Subtitulo do card.
  final Color corCard;        // Cor do card.
  final Color corCardTitulo;  // Cor do card do titulo.
  final bool margemTopo;      // Indica se o card vai ter uma margem do topo.
  final List<Custom_TextField_Informacao> informacoes;  // Lista com as informacoes.

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margemTopo ? const EdgeInsets.only(top: 50.0) : EdgeInsets.zero,  // Margem do topo.
      color: corCard,                                         // Cor do card.
      child: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              elevation: 15,
              color: corCardTitulo,                           // Cor do card do titulo.
              child:
              ListTile(
                leading: icone,                               // Icone.
                title: Text(titulo, style: styleTitle),       // Titulo.
                subtitle: subtitulo == null ? null
                    : Text(subtitulo!, style: styleBold),     // Subtitulo.
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(children: informacoes),           // Lista com as informacoes.
            ),
          ],
        ),
      ),
    );
  }
}


//============================================================================//
// SHOW DIALOGO         SHOW DIALOGO        SHOW DIALOGO         SHOW DIALOGO
//============================================================================//

/*  FUNCAO:
*   Exibe uma mensagem de dialogo
*   para que o utilizador confirme.
*/
Future<bool> ShowDialog_ConfirmarMensagem(BuildContext context, String mensagem) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      // backgroundColor: Colors.white, // Cor de fundo.
      title:   const Text('Você está saindo'),  // Titulo da mensagem.
      content: Text(mensagem),                  // Mensagem.
      titleTextStyle:   styleTituloDialogo,     // Estilo de fonte do titulo.
      contentTextStyle: styleMensagemDialogo,   // Estilo de fonte da mensagem.
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),   // Botao que retorna "true" para a mensagem.
          child: const Text('SIM', style: styleBotaoDialogo),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),  // Botao que retorna "false" para a mensagem.
          child: const Text('NÃO', style: styleBotaoDialogo),
        ),
      ],
    ),
  ) ?? false; // Caso onde o utilizador clica fora do dialogo.
}