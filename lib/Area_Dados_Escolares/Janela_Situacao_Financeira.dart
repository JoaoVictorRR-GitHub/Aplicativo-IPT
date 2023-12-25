import 'package:flutter/material.dart';

import '../Fontes.dart' show mensagemVoltarDadosEscolares;
import '../Topicos.dart' show Topicos_DrawerAluno;
import '../WebView_URLs.dart' show WebViewApp, siteSituacaoFinanceira;
import '../Widgets_Padroes.dart';
import '../Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart';


// Paleta de cores da pagina.
const Color corIcones = Colors.deepOrangeAccent;
const Color corCardsTitle = Colors.deepPurpleAccent;

// Estilos de texto customizados.
const TextStyle styleTitle_01 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueAccent);


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela sobre a situacao
*   financeira do aluno.  */
class Aluno_SituacaoFinanceira extends StatelessWidget {
  const Aluno_SituacaoFinanceira({super.key});

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
        appBar: const Custom_AppBar(imagem: "imagens/Foto_IPT.jpg"),    // AppBar customizavel.
        drawer: Custom_Drawer(lstTopicos: Topicos_DrawerAluno),         // Drawer customizavel.
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,       // Cor do botao.
                foregroundColor: Colors.deepPurpleAccent, // Cor do botao quando pressionado.
              ),
              onPressed: () {
                // Redirecionamento para a pagina da escola.
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewApp(webSite: siteSituacaoFinanceira)));
              },
              child: const Card(
                color: Colors.white70,
                child: ListTile(
                  title: Text("IR PARA DETALHES", style: styleTitle_01, textAlign: TextAlign.center),
                ),
              ),
            ),
            Custom_Card_Informacao(
              titulo: "EXTRATO FINANCEIRO:",
              informacoes: infoExtrato,
              corCardTitulo: Colors.deepOrangeAccent,
              icone: const Icon(Icons.balance_sharp, color: Colors.deepPurple),
            ),
            Custom_Card_Informacao(
              titulo: "PROPINAS:",
              informacoes: infoPropinas,
              corCardTitulo: corCardsTitle,
              icone: const Icon(Icons.money_sharp, color: corIcones),
            ),
            Custom_Card_Informacao(
              titulo: "EMOLUMENTOS:",
              informacoes: infoEmolumentos,
              corCardTitulo: corCardsTitle,
              icone: const Icon(Icons.attach_money_sharp, color: corIcones),
            ),
            Custom_Card_Informacao(
              titulo: "TAXAS:",
              informacoes: infoTaxas,
              corCardTitulo: corCardsTitle,
              icone: const Icon(Icons.money_off_csred_sharp, color: corIcones),
            ),
          ],
        ),
      ),
    );
  }
}


//============================================================================//
// DADOS        DADOS        DADOS            DADOS        DADOS        DADOS
//============================================================================//

/*  Lista de dados sobre o extrato
*   financeiro do aluno inseridos
*   em TextFields customizados. */
List<Custom_TextField_Informacao> infoExtrato = [
  Custom_TextField_Informacao(descricaoCampo: 'Total caixa:',  info: dadosAluno['Total_caixa']),
  Custom_TextField_Informacao(descricaoCampo: 'Total divida:', info: dadosAluno['Total_divida']),
  Custom_TextField_Informacao(descricaoCampo: 'Saldo:',        info: dadosAluno['Saldo']),
];

/*  Lista de dados sobre as propinas da
*   situacao financeira do aluno inseridos
*   em TextFields customizados. */
List<Custom_TextField_Informacao> infoPropinas = [
  Custom_TextField_Informacao(descricaoCampo: 'Em atraso:', info: dadosAluno['Total_atraso']),
  Custom_TextField_Informacao(descricaoCampo: 'A vencer:',  info: dadosAluno['Total_vencimento']),
];

/*  Lista de dados sobre os emolumentos da
*   situacao financeira do aluno inseridos
*   em TextFields customizados. */
List<Custom_TextField_Informacao> infoEmolumentos = [
  Custom_TextField_Informacao(descricaoCampo: 'Em dívida:', info: dadosAluno['Total_divida_emolumento']),
];

/*  Lista de dados sobre as taxas financeiras do
*   aluno inseridos em TextFields customizados. */
List<Custom_TextField_Informacao> infoTaxas = [
  Custom_TextField_Informacao(descricaoCampo: 'Divida calculada:',  info: dadosAluno['Taxa_calculada']),
  Custom_TextField_Informacao(descricaoCampo: 'Dívida a calcular:', info: dadosAluno['Taxa_calcular']),
];