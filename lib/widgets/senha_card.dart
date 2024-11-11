import 'package:flutter/material.dart';
import '../models/senha.dart';

class SenhaCard extends StatelessWidget {
  final Senha senha;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  SenhaCard({
    required this.senha,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          senha.servico,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text('Senha: ${senha.senha}'),
            SizedBox(width: 8),
            Chip(
              label: Text(senha.importante ? 'Importante' : 'Normal'),
              backgroundColor: senha.importante ? Colors.red.shade200 : Colors.grey.shade200,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
