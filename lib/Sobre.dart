import 'package:flutter/material.dart';

import 'Fontes.dart' show styleBold, styleTopicos;


//============================================================================//
// INFO APLICATIVO    INFO APLICATIVO      INFO APLICATIVO    INFO APLICATIVO
//============================================================================//

/*  Informacoes sobre o aplicativo. */
class Info_Aplicativo extends StatelessWidget {
  const Info_Aplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutListTile(
      icon: const Icon(Icons.info_sharp, color: Colors.black54),
      applicationIcon: const Icon(Icons.api_sharp, color: Colors.blue),
      applicationName:      "IPT App",
      applicationVersion:   "Versão: 1.1.0",
      applicationLegalese:  "Copyright © 2023 João Victor RR - DADM",
      aboutBoxChildren: [   // Informacoes.
        const Text(""),
        RichText(
          textAlign: TextAlign.justify,
          text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: "Aplicativo desenvolvido como trabalho final da disciplina "),
              TextSpan(text: "'Desenvolvimento de Aplicações para Dispositivos Movéis' ", style: styleBold),
              TextSpan(text: "na Escola Superior de Tecnologia de Abrantes "),
              TextSpan(text: "(ESTA).", style: styleBold),
            ],
          ),
        ),
        const Text(""),
        RichText(
          textAlign: TextAlign.justify,
          text: const TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(text: "Este aplicativo tem como objetivo a disponibilização de algumas informações e serviços, presentes no website oficial do "),
              TextSpan(text: "Instituto Politécnico de Tomar (IPT), ", style: styleBold),
              TextSpan(text: "de um modo mais dinâmico e intuitivo. Sua utilização foi elaborada levando-se em conta, principalmente, novos alunos e estrangeiros."),
            ],
          ),
        ),
      ],
      child: const Text("SOBRE", style: styleTopicos),
    );
  }
}