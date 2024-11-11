// test/models/senha_model_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:aep/models/senha.dart';
import 'package:aep/main.dart';
import 'package:flutter/material.dart';
import 'package:aep/screens/adicionar_senha_page.dart';

void main() {
  test('Deve criar uma instância de Senha', () {
    final senha = Senha(servico: 'Email', senha: 'senha123', importante: true);

    expect(senha.servico, 'Email');
    expect(senha.senha, 'senha123');
    expect(senha.importante, true);
  });

  test('Deve alterar o serviço da senha', () {
    final senha = Senha(servico: 'Email', senha: 'senha123', importante: false);
    senha.servico = 'Banco';

    expect(senha.servico, 'Banco');
  });

  testWidgets('Formulário de adicionar senha funciona corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AdicionarSenhaPage(onSenhaAdicionada: (senha) {}),
    ));

    // Verifica os campos
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Título'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);

    // Digita no campo de título e senha
    await tester.enterText(find.byKey(Key('tituloTextField')), 'Redes Sociais');
    await tester.enterText(find.byKey(Key('senhaTextField')), 'senhaSecreta');

    // Pressiona o botão de adicionar
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifica se o formulário foi preenchido e a ação foi executada
    expect(find.text('Redes Sociais'), findsOneWidget);
    expect(find.text('senhaSecreta'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Construa o widget de teste
    await tester.pumpWidget(MyApp());

    // Verifique se o texto inicial "0" está presente
    expect(find.text('0'), findsOneWidget);

    // Encontre o botão e toque nele
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump(); // Reconstroi o widget após o clique

    // Verifique se o contador foi incrementado e o texto "1" está presente
    expect(find.text('1'), findsOneWidget);
  });
}
