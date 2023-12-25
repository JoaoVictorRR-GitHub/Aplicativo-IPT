import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Topicos.dart' show Topicos_Drawer;
import '../Fontes.dart';
import '../Widgets_Padroes.dart';
import '../Area_Inicial/Paginas_IPT/Janela_Inicial.dart' show Inicio;
import '../Area_Dados_Escolares/Dados_Pessoais/Janela_Dados_Pessoais.dart' show Aluno_DadosPessoais;


//============================================================================//
// JANELA       JANELA       JANELA          JANELA       JANELA       JANELA
//============================================================================//

/*  Janela de login para a
*   area de dados escolares.  */
class LoginIPT extends StatefulWidget {
  const LoginIPT({super.key});

  @override
  State<LoginIPT> createState() => _LoginIPTState();
}

class _LoginIPTState extends State<LoginIPT> {

  CollectionReference infoAluno = FirebaseFirestore.instance.collection('Dados_Alunos');
  TextEditingController usuario = TextEditingController();
  TextEditingController senha   = TextEditingController();
  bool loginEfetuado = false; // Indica se o login foi efetuado.


  // Metodo para efetuar o login do aluno.
  Future efetuarLogin() async {
    try {
      // Verificacao dos campos.
      if ((usuario.text.isNotEmpty) && (senha.text.isNotEmpty)) {
        // Verificacao do usuario e senha na base de dados.
        var info = await infoAluno.where('Usuario', isEqualTo: usuario.text).where('Senha', isEqualTo: senha.text).get();

        // CASO: Usuario encontrado.
        if (info.size == 1){  // info.size == 1 funciona offline pois o firebase usa um cache pra isso.
          // Limpando os campos.
          setState(() {
            usuario.text = "";
            senha.text = "";
            loginEfetuado = true; // Indica que o login foi efetuado com sucesso.
          });
          // Redirecionamento para a janela de dados pessoais do aluno.
          await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Aluno_DadosPessoais(dados: info.docs[0])));
        }
        else {
          // CASO: Usuario nao encontrado (Mensagem).
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('1 - Verifique sua conexão com a internet.\n2 - Confira se o usuário e a senha estão corretos.')));
          return const Center(child: CircularProgressIndicator(value: 1));
        }
      }
      else {
        // CASO: Campos vazios (Mensagem).
        setState(() { loginEfetuado = false; });  // Indica que o login nao foi efetuado.
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Os campos não podem estar vazios.')));
        return const Center(child: CircularProgressIndicator(value: 1));
      }
    } catch (erro) {
      // CASO: Erro durante a verificacao (Mensagem).
      setState(() { loginEfetuado = false; });  // Indica que o login nao foi efetuado.
      showDialog (context: context, builder: (context){
        return AlertDialog(
          backgroundColor:  Colors.lightBlue, // Cor de fundo.
          title:            const Text('Erro ao realizar login!'),
          content:                Text('Ocorreu um erro ao tentar realizar o login. $erro', textAlign: TextAlign.justify),
          titleTextStyle:   styleTituloDialogoErro, // Estilo de fonte do titulo.
          contentTextStyle: styleMensagemDialogo,   // Estilo de fonte da mensagem.
          actions: [
            TextButton(
              onPressed: (){ Navigator.pop(context); },
              child: const Text('OK', style: styleBotaoDialogo),
            ),
          ],
        );
      });
    }
  }

  // Janela de login.
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
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          children: [
            const PainelLogin(),  // Painel customizado.
            Container(
              margin: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0, bottom: 50.0),
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 25,
                    controller: usuario,
                    decoration: const InputDecoration(labelText: 'Usuário'),
                    style: styleBold,
                  ),
                  TextFormField(
                    maxLength: 16,
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    style: styleBold,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,       // Cor do botao.
                foregroundColor: Colors.lightGreenAccent, // Cor do botao quando pressionado.
              ),
              onPressed: (){
                // Verifica se o login foi efetuado com sucesso.
                if (loginEfetuado) {
                  // Mensagem.
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('A página sera aberta em instantes. Aguarde...')));
                } else {
                  efetuarLogin();
                }
              },
              child: const Text('ENTRAR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70)),
            ),
          ],
        ),
      ),
    );
  }
}


//============================================================================//
// CARD PERSONALIZADO          CARD PERSONALIZADO          CARD PERSONALIZADO
//============================================================================//

/*  WIDGET:
*   Card personalizado com uma mensagem
*   para a utilizacao na janela de login.
*/
class PainelLogin extends StatelessWidget {
  const PainelLogin({super.key});

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
          title: Icon(Icons.my_library_books_sharp, size: 50, color: Colors.deepOrangeAccent),
          subtitle: Text('ACESSAR DADOS ESCOLARES', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.lightGreen)),
        ),
      ),
    );
  }
}