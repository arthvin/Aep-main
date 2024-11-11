import 'package:flutter/material.dart';
import '../models/senha.dart';

class AdicionarSenhaPage extends StatefulWidget {
  final Function(Senha) onSenhaAdicionada;
  final Senha? senha;

  AdicionarSenhaPage({required this.onSenhaAdicionada, this.senha});

  @override
  _AdicionarSenhaPageState createState() => _AdicionarSenhaPageState();
}

class _AdicionarSenhaPageState extends State<AdicionarSenhaPage> {
  final _servicoController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _importante = false;

  @override
  void initState() {
    super.initState();
    if (widget.senha != null) {
      _servicoController.text = widget.senha!.servico;
      _senhaController.text = widget.senha!.senha;
      _importante = widget.senha!.importante;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.senha == null ? 'Adicionar Senha' : 'Editar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _servicoController,
              decoration: InputDecoration(labelText: 'Serviço'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 12),
            SwitchListTile(
              title: Text('Importante'),
              value: _importante,
              onChanged: (value) {
                setState(() {
                  _importante = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_servicoController.text.isNotEmpty && _senhaController.text.isNotEmpty) {
                  final senha = Senha(
                    servico: _servicoController.text,
                    senha: _senhaController.text,
                    importante: _importante,
                  );
                  widget.onSenhaAdicionada(senha);
                  Navigator.pop(context);
                }
              },
              child: Text(widget.senha == null ? 'Adicionar' : 'Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
