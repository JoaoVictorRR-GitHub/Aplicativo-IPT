import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'Area_Inicial/Paginas_IPT/Janela_Inicial.dart' show Inicio;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),  // Desativa o material 3 (Ele muda o padrao e cores de alguns widgets).
      debugShowCheckedModeBanner: false,
      home: const Inicio(),
    );
  }
}