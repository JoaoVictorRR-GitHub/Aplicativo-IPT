import 'package:flutter/material.dart';

import '../../Destaques.dart';
import '../../WebView_URLs.dart';
import '../../Widgets_Padroes.dart' show PainelPersonalizado;
import '../Paginas_IPT/Janela_Inicial.dart' show Inicio;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

// Pagina home.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Custom_Carrosel_Destaques(  // Carrosel de destaques customizavel.
          autoPlay: true,
          autoPlayMinutos: 1,
          proporcaoTela: 2.0,
          fracaoTela: 1.0,
          lstDestaques: Lista_BannersHome,  // Banners.
        ),
        const Padding(padding: EdgeInsets.only(top: 40.0)),
        Custom_Carrosel_Destaques(  // Carrosel de destaques customizavel.
          autoPlay: true,
          autoPlayMinutos: 3,
          fracaoTela: 0.5,
          ampliar: true,
          lstDestaques: Lista_DestaquesHome,  // Destaques.
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: PainelPersonalizado(),
        ),
      ],
    );
  }
}


//============================================================================//
// DESTAQUE       DESTAQUE          DESTAQUE          DESTAQUE       DESTAQUE
//============================================================================//

/*  Lista de banners de destaque da
*   pagina home do aplicativo IPT.  */
List<Destaques> Lista_BannersHome = [
  Destaques(WebViewApp(webSite: siteIPT), "imagens/Banner_Destaque01.png"),
  Destaques(const Inicio(),               "imagens/Banner_Destaque02.jpg"),
  Destaques(const Inicio(),               "imagens/Logo_IPT02.png"),
  Destaques(const Inicio(),               "imagens/Logo_ESTA.png"),
  Destaques(const Inicio(),               "imagens/Foto_IPT.jpg"),
];

/*  Lista de eventos em destaque da
*   pagina home do aplicativo IPT.  */
List<Destaques> Lista_DestaquesHome = [
  Destaques(WebViewApp(webSite: siteDestaque01), "imagens/Imagem_Destaque01.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque02), "imagens/Imagem_Destaque02.jpg"),
  Destaques(WebViewApp(webSite: siteDestaque03), "imagens/Imagem_Destaque03.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque04), "imagens/Imagem_Destaque04.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque05), "imagens/Imagem_Destaque05.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque06), "imagens/Imagem_Destaque06.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque07), "imagens/Imagem_Destaque07.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque08), "imagens/Imagem_Destaque08.jpeg"),
  Destaques(WebViewApp(webSite: siteDestaque09), "imagens/Imagem_Destaque09.jpeg"),
];