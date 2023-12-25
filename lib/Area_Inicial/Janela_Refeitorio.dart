import 'package:flutter/material.dart';

import '../Fontes.dart' show mensagemVoltarInicio, styleTitle;
import '../Topicos.dart' show Topicos_Drawer;
import '../WebView_URLs.dart' show WebViewApp, siteRefeitorio;
import '../Widgets_Padroes.dart';
import '../Area_Inicial/Paginas_IPT/Janela_Inicial.dart' show Inicio;


// Estilos de texto customizados.
const TextStyle styleTitle_00 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigoAccent);
const TextStyle styleTitle_01 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.indigoAccent);
const TextStyle styleTitle_02 = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
const TextStyle styleTitle_03 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black54);
const TextStyle styleTitle_04 = TextStyle(color: Colors.black54);


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela sobre o refeitorio.  */
class RefeitorioIPT extends StatefulWidget {
  const RefeitorioIPT({super.key});

  @override
  State<RefeitorioIPT> createState() => _RefeitorioIPTState();
}

class _RefeitorioIPTState extends State<RefeitorioIPT> {

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // Exibe uma mensagem antes de sair da pagina.
        final bool sair = await ShowDialog_ConfirmarMensagem(context, mensagemVoltarInicio);
        if (sair) { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Inicio())); }
      },
      child: Scaffold(
        appBar: const Custom_AppBar(imagem: "imagens/Foto_IPT.jpg"),  // AppBar customizavel.
        drawer: Custom_Drawer(lstTopicos: Topicos_Drawer),            // Drawer customizavel.
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,       // Cor do botao.
                foregroundColor: Colors.lightGreenAccent, // Cor do botao quando pressionado.
              ),
              onPressed: () {
                // Redirecionamento para o website do refeitorio.
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewApp(webSite: siteRefeitorio)));
              },
              child: const Card(
                color: Colors.white70,
                child: ListTile(
                  title: Text("AGENDAR REFEIÇÕES ON-LINE", style: styleTitle_00, textAlign: TextAlign.center),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              child: const Card(
                color: Colors.white60,
                child: Column(
                  children: [
                    Card(
                      elevation: 15,
                      color: Colors.indigoAccent,
                      child: ListTile(
                        title: Text("HORÁRIOS", style: styleTitle, textAlign: TextAlign.center),
                        subtitle: Text("DE FUNCIONAMENTO", style: styleTitle, textAlign: TextAlign.center),
                      ),
                    ),
                    ListTile(
                      title: Text("ALMOÇO", style: styleTitle_02, textAlign: TextAlign.center),
                      subtitle: Text("12:30 às 14:30", style: styleTitle_03, textAlign: TextAlign.center),
                    ),
                    ListTile(
                      title: Text("JANTA", style: styleTitle_02, textAlign: TextAlign.center),
                      subtitle: Text("18:30 às 20:30", style: styleTitle_03, textAlign: TextAlign.center),
                    ),
                    ListTile(
                      title: Text("SEGUNDA À SEXTA", style: styleTitle_02, textAlign: TextAlign.center),
                      subtitle: Text("EXCETO FERIADOS", style: styleTitle_01, textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white70,
              child: Column(
                children: [
                  const Card(
                    elevation: 15,
                    color: Colors.indigoAccent,
                    child: ListTile(
                      title: Text("NOTA:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.yellowAccent)),
                    ),
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(5),
                    title: RichText(
                      textAlign: TextAlign.justify,
                      text: const TextSpan(
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                        children: [
                          TextSpan(text: "O agendamento das refeições pode ser realizado diretamente pelo site "),
                          TextSpan(text: "(http://refeitorio.ipt.pt)", style: styleTitle_04),
                          TextSpan(text: " ou na máquina próximo a secretaria. O prazo para o agendamento do almoço é até as "),
                          TextSpan(text: "10h ", style: styleTitle_04),
                          TextSpan(text: "da manhã do mesmo dia, e o agendamento da janta deve ser realizado até as "),
                          TextSpan(text: "16h", style: styleTitle_04),
                          TextSpan(text: " do mesmo dia."),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}