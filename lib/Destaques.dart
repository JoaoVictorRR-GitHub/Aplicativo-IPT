import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


//============================================================================//
// CLASSE DESTAQUES   CLASSE DESTAQUES    CLASSE DESTAQUES   CLASSE DESTAQUES
//============================================================================//

/*  CLASSE:
*   Classe para criacao de destaques com
*   imagem e pagina de direcionamento
*   para Web ou paginas do aplicativo.
*/
class Destaques {
  Widget pagina;  // Pagina para onde o destaque ira levar.
  String imagem;  // Imagem de exibicao do destaque.

  Destaques(this.pagina, this.imagem);
}


//============================================================================//
// CARROSEL DESTAQUES          CARROSEL DESTAQUES          CARROSEL DESTAQUES
//============================================================================//

/*  WIDGET:
*   Carrosel personalizado para exibir,
*   dinamicamente, destaques em uma pagina
*   (Destaques e parametros Customizaveis).
*/
class Custom_Carrosel_Destaques extends StatelessWidget {
  const Custom_Carrosel_Destaques({super.key,
    this.autoPlay         = false,
    this.proporcaoTela    = 16/9,
    this.fracaoTela       = 0.8,
    this.ampliar          = false,
    this.fatorAmpliacao   = 0.3,
    this.autoPlayMinutos  = 1,
    required this.lstDestaques,
    this.substituirPagina = false,
  });

  final bool autoPlay;          // Indica se o slider dos destaque vai ser automatico.
  final double proporcaoTela;   // Proporcao do destaque em relacao a tela.
  final double fracaoTela;      // Fracao do destaque na proporcao da tela.
  final bool ampliar;           // Indica se os destaques podem ampliar em um slider.
  final double fatorAmpliacao;  // Fator de amplicao entre os destaques em um slider.
  final int autoPlayMinutos;    // Tempo, em minutos, para o slider automatico.

  final List<Destaques> lstDestaques; // Lista de destaques.
  final bool substituirPagina;        // Indica como a pagina do destaque sera chamada (push() = false ou pushReplacement() = true).

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay:           autoPlay,         // Slider automatico.
        aspectRatio:        proporcaoTela,    // Proporcao do destaque em relacao a tela.
        viewportFraction:   fracaoTela,       // Fracao do destaque na proporcao da tela.
        enlargeCenterPage:  ampliar,          // Indica se os destaques podem ampliar em um slider.
        enlargeFactor:      fatorAmpliacao,   // Fator de amplicao entre os destaques em um slider.
        autoPlayInterval: Duration(minutes: autoPlayMinutos), // Intervalo entre os sliders automaticos.
      ),
      items: lstDestaques.map((destaque){
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              // Redirecionamento para a pagina do destaque quando clicado.
              substituirPagina ?
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => destaque.pagina))
                  : Navigator.push(context, MaterialPageRoute(builder: (context) => destaque.pagina));
            },
            // Personalizacao dos destaques do carrosel.
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 15,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                child: Image.asset(destaque.imagem, fit: BoxFit.cover, width: MediaQuery.of(context).size.width), // Cover --- fill.
              ),
            ),
          );
        });
      },
      ).toList(),
    );
  }
}