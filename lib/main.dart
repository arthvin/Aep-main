import 'package:flutter/material.dart';
import 'screens/senhas_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Senhas',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
      ),
      home: SenhasListPage(),
    );
  }
}
