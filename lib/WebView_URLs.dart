import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Fontes.dart';
import 'Widgets_Padroes.dart' show ShowDialog_ConfirmarMensagem;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela de acesso para paginas
*   externas dentro do aplicativo.  */
class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key, required this.webSite});
  final Uri webSite;

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {

  // Configuracao do gerenciador de cookies da conexao network.
  late WebViewCookieManager webViewCookieManager = WebViewCookieManager();

  // Configuracao do controller para a conexao network dentro do aplicativo.
  late WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)  // Permite scripts java.
    ..enableZoom(true)                                // Indica se o zoom eh permitido dentro do aplicativo.
    ..setBackgroundColor(const Color(0x00000000))     // Cor de fundo.
    ..setNavigationDelegate(                          // Gerenciamento da conexao.
      NavigationDelegate(
        onProgress: (int progress) {
          debugPrint('WebView is loading (progress : $progress%)');
          // Acoes durante o carregamento.
        },
        onPageStarted: (String url) {
          debugPrint('Page started loading: $url');
          // Acoes enquanto a pagina eh iniciada.
        },
        onPageFinished: (String url) {
          debugPrint('Page finished loading: $url');
          // Acoes enquando a pagina eh finalizada.

          // Limpa o cache e os cookies que foram armazenados.
          webViewController.clearCache();
          webViewController.clearLocalStorage();
          webViewController.platform.clearCache();
          webViewController.platform.clearLocalStorage();
          webViewCookieManager.clearCookies();
        },
        onWebResourceError: (WebResourceError error) {
          debugPrint('''
          Page resource error:
          code: ${error.errorCode}
          description: ${error.description}
          errorType: ${error.errorType}
          isForMainFrame: ${error.isForMainFrame}
          ''');
          // Acoes durante um erro.
        },
        onNavigationRequest: (NavigationRequest request) {
          // Acoes de requisicao.
          if (request.url.startsWith('https://www.youtube.com/')) {
            debugPrint('blocking navigation to ${request.url}');
            return NavigationDecision.prevent;
          }
          debugPrint('allowing navigation to ${request.url}');
          return NavigationDecision.navigate;
        },
        onUrlChange: (UrlChange change) {
          debugPrint('url change to ${change.url}');
        },
      ),
    )
    ..addJavaScriptChannel(
      'Toaster',
      onMessageReceived: (JavaScriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    )
    ..loadRequest(widget.webSite);  // Conexao com a Url (pre-definida).


  // Configuracao do AppBar que aparece no aplicativo.
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // Exibe uma mensagem antes de sair da pagina.
        final NavigatorState navi = Navigator.of(context);
        final bool sair = await ShowDialog_ConfirmarMensagem(context, mensagemSairPaginaExterna);
        if (sair) { navi.pop(); }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              color: Colors.white70,
              enableFeedback: true,
              padding: const EdgeInsets.only(left: 15.0),
              onPressed: () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.grid_view_outlined, size: 40),
            ),
          ),
          elevation: 20,
          toolbarHeight: 85,
          centerTitle: true,
          title: const Text('WebView: Acesso à página externa.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          backgroundColor: Colors.purple,
        ),
        body: WebViewWidget(controller: webViewController), // Redirecionamento para o website indicado.
      ),
    );
  }
}


//============================================================================//
// URLS      URLS      URLS      URLS      URLS      URLS      URLS      URLS
//============================================================================//

// Area inicial.
Uri siteIPT                   = Uri.parse('https://www.ipt.pt/');
Uri siteRefeitorio            = Uri.parse('http://refeitorio.ipt.pt/');

// Area de dados escolares.
Uri siteSituacaoFinanceira    = Uri.parse('https://netpa.ipt.pt/esta/page?stage=SituacaoFinanceira');
//
Uri sitePlanosEstudo          = Uri.parse('https://netpa.ipt.pt/esta/DIFTasks?_PR_=1&_AP_=3&_MD_=1&_SR_=125&_ST_=1');
Uri siteSituacaoCurricular    = Uri.parse('https://netpa.ipt.pt/esta/page?stage=situacaodealuno');
Uri siteUnidadesCurriculares  = Uri.parse('https://netpa.ipt.pt/esta/page?stage=ConsultaNotasAluno');
Uri siteBolsas                = Uri.parse('https://netpa.ipt.pt/esta/page?stage=ConsultaBolsaEstudos');
Uri siteExames                = Uri.parse('https://netpa.ipt.pt/esta/page?stage=CalendarioExamesAluno');
Uri siteFaltas                = Uri.parse('https://netpa.ipt.pt/esta/page?stage=ConsultaFaltasAlunos');
//
Uri siteMatricula             = Uri.parse('https://netpa.ipt.pt/esta/DIFTasks?_PR_=1&_AP_=18&_MD_=1&_SR_=INDSP&_ST_=1');
Uri siteFormacaoAvancada      = Uri.parse('https://netpa.ipt.pt/esta/page?stage=MinhasFormacoesAvancadas');
Uri siteEstagio               = Uri.parse('https://netpa.ipt.pt/esta/page?stage=MeusEstagios');
Uri siteInscricaoExames       = Uri.parse('https://netpa.ipt.pt/esta/page?stage=ConsultaInscricaoEpocas');
Uri siteRevisaoNotas          = Uri.parse('https://netpa.ipt.pt/esta/page?stage=listapedidosrevisaonotasaluno');
Uri siteRequisitarDocs        = Uri.parse('https://netpa.ipt.pt/esta/page?stage=pedidodocumentosseleccaodocs');
//
Uri siteAtividadesCurriculares    = Uri.parse('https://netpa.ipt.pt/esta/page?stage=AtividadesExtraCurricularesAluno&activePanel=atividadesCurriculares');
Uri siteAtividadaeNaoCurriculares = Uri.parse('https://netpa.ipt.pt/esta/page?stage=AtividadesExtraCurricularesAluno&activePanel=atividadesExtraCurriculares');
Uri siteCompetenciasLinguisticas  = Uri.parse('https://netpa.ipt.pt/esta/page?stage=CompetenciasLinguisticasAluno');

// Destaques.
Uri siteDestaque01  = Uri.parse('https://portal2.ipt.pt/pt/noticias/conferencias/seminario_dia_internacional_das_pessoas_com_deficiencia_2023_11_30');
Uri siteDestaque02  = Uri.parse('https://portal2.ipt.pt/pt/noticias/institucional/cerimonia_de_tomada_de_posse_do_presidente_eleito_2023_11_30');
Uri siteDestaque03  = Uri.parse('https://portal2.ipt.pt/pt/noticias/conferencias/5_s_jornadas_de_turismo_turismo_cultural_e_religioso_2023_11_28');
Uri siteDestaque04  = Uri.parse('https://portal2.ipt.pt/pt/noticias/institucional/tomada_de_posse_diretores_de_escolas_de_tomar_2023_12_05');
Uri siteDestaque05  = Uri.parse('https://portal2.ipt.pt/pt/noticias/institucional/cerimonia_de_tomada_de_posse_diretora_da_escola_superior_de_tecnologia_de_abrantes_2023_12_05');
Uri siteDestaque06  = Uri.parse('https://portal2.ipt.pt/pt/noticias/conferencias/dia_internacional_dos_direitos_humanos_2023_12_05');
Uri siteDestaque07  = Uri.parse('https://portal2.ipt.pt/pt/noticias/conferencias/conferencia_internacional_violencia_en_tramada_e_comunidades_em_resistencia_2023_12_04');
Uri siteDestaque08  = Uri.parse('https://portal2.ipt.pt/pt/noticias/conferencias/aula_aberta_tourism_meeting_point_2023_12_04');
Uri siteDestaque09  = Uri.parse('https://portal2.ipt.pt/pt/noticias/conferencias/conversa_sobre_2023_12_04');