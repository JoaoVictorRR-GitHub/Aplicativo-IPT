import 'package:flutter/material.dart';

// Estilos de texto customizados (TITULOS).
const TextStyle styleBold       = TextStyle(fontWeight: FontWeight.bold);
const TextStyle styleTitle      = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white);
const TextStyle styleTopicos    = TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
const TextStyle styleSubTopicos = TextStyle(fontWeight: FontWeight.bold, fontSize: 12);

// Estilos de texto customizados (MENSAGENS DE DIALOGO).
const TextStyle styleTituloDialogo      = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green);
const TextStyle styleTituloDialogoErro  = TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red);
const TextStyle styleMensagemDialogo    = TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blueGrey);
const TextStyle styleBotaoDialogo       = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

// Mensagens padrao do sistema.
const String mensagemVoltarInicio         = "Deseja voltar para a página inicial ?";
const String mensagemVoltarDadosEscolares = "Deseja voltar para a página de dados pessoais ?";
const String mensagemSairAplicativo       = "Deseja sair do aplicativo ?";
const String mensagemSairPaginaExterna    = "Deseja sair da página ?\n\nSe houver contas logadas na página elas serão deslogadas.";

// Criar paleta de cores.