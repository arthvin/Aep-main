import 'package:flutter/material.dart';
import '../models/senha.dart';
import 'adicionar_senha_page.dart';
import '../widgets/senha_card.dart';

class SenhasListPage extends StatefulWidget {
  @override
  _SenhasListPageState createState() => _SenhasListPageState();
}

class _SenhasListPageState extends State<SenhasListPage> {
  List<Senha> senhas = [
    Senha(servico: 'Google', senha: '1234', importante: true),
    Senha(servico: 'Facebook', senha: 'abcd', importante: false),
    Senha(servico: 'Amazon', senha: '4321', importante: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador de Senhas'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: senhas.length,
          itemBuilder: (context, index) {
            final senha = senhas[index];
            return SenhaCard(
              senha: senha,
              onEdit: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdicionarSenhaPage(
                      onSenhaAdicionada: (senhaEditada) {
                        _editarSenha(index, senhaEditada);
                      },
                      senha: senha,
                    ),
                  ),
                );
              },
              onDelete: () {
                _removerSenha(index);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple, // Cor roxo mais escuro
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AdicionarSenhaPage(onSenhaAdicionada: _adicionarSenha),
            ),
          );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Centralizado no rodapé
    );
  }

  void _adicionarSenha(Senha senha) {
    setState(() {
      senhas.add(senha);
    });
  }

  void _editarSenha(int index, Senha senhaEditada) {
    setState(() {
      senhas[index] = senhaEditada;
    });
  }

  void _removerSenha(int index) {
    setState(() {
      senhas.removeAt(index);
    });
  }
}
