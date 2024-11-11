Documentação
Este é um aplicativo de gerenciamento de senhas desenvolvido em Flutter. Ele permite que o usuário adicione, edite, visualize e remova senhas de diferentes serviços, armazenando informações importantes em uma interface amigável e organizada.

O aplicativo se comunica com um backend simulado utilizando json-server, o que possibilita a persistência dos dados durante o desenvolvimento e testes. Isso permite um ambiente de teste semelhante a uma API real, sem a necessidade de backend completo.

Requisitos
Flutter SDK: versão 3.0 ou superior.
json-server: para simular um backend JSON para as operações de CRUD.
Git: para controle de versão e colaboração no desenvolvimento.
Editor de Código: como Visual Studio Code ou Android Studio.
Dependências do Projeto
As dependências Flutter incluem:

flutter/material.dart: para widgets e temas de UI.
http: para requisições HTTP (necessário para comunicação com o json-server).
flutter_test: para desenvolvimento e execução de testes unitários.
Instalação das Dependências
No arquivo pubspec.yaml, as dependências necessárias já estão listadas. Execute o comando para instalar todas:

Terminal flutter pub get

Estrutura de Arquivos e Código
O projeto está organizado nas seguintes pastas principais:

lib: onde está a lógica do app e as telas.

models: contém a classe Senha, que representa o modelo de dados.
screens: contém as telas principais, incluindo listagem e formulário de edição/adição de senhas.
widgets: contém componentes reutilizáveis, como o cartão para exibir cada senha.
test: contém os testes unitários para o modelo e widgets do app.

Arquivos Principais
main.dart: inicializa o app e define a estrutura base do tema.
senha.dart (em models): define o modelo Senha com os campos servico, senha e importante.
senha_list_page.dart (em screens): exibe a lista de senhas, permitindo que o usuário adicione, edite ou remova uma senha.
adicionar_senha_page.dart (em screens): fornece um formulário para adicionar ou editar senhas.
senha_card.dart (em widgets): um widget customizado para exibir cada senha em um cartão com opções de editar e remover.
Funcionalidades do Aplicativo
Tela de Listagem de Senhas
Na tela de listagem, todas as senhas salvas são exibidas, com opções de adicionar uma nova senha, editar ou excluir senhas existentes.

Tela de Formulário para Adição/Edição de Senha
Ao adicionar ou editar uma senha, o usuário preenche os seguintes campos:

Serviço: o nome do serviço ao qual a senha se refere (ex.: "Email", "Banco").
Senha: a senha associada ao serviço.
Importante: indica se o serviço é considerado importante.
CRUD (Create, Read, Update, Delete)
O aplicativo se comunica com o json-server para realizar as operações de CRUD:

Create: ao adicionar uma nova senha, o app envia uma requisição POST ao servidor.
Read: ao abrir a lista, o app faz uma requisição GET para obter todas as senhas salvas.
Update: ao editar uma senha, uma requisição PUT é enviada com os dados atualizados.
Delete: ao remover uma senha, uma requisição DELETE é feita para excluí-la do servidor.
Testes
Os testes estão na pasta test e cobrem o seguinte:

Model Test (senha_model_test.dart): verifica se o modelo Senha é instanciado corretamente.
Widget Test (senha_card_test.dart): verifica se o cartão de senha exibe as informações corretas e se os botões de ação respondem adequadamente.
Integração: testa o fluxo completo, desde a adição até a exclusão de uma senha.
Para rodar os testes:

Terminal flutter test

Instruções de Configuração do Backend (json-server)
O json-server simula um backend e permite persistir os dados para operações de CRUD.

Instale o json-server:

Terminal npm install -g json-server

Crie o arquivo db.json com o seguinte conteúdo inicial:

json { "senhas": [] }

Inicie o servidor com o comando:

Terminal json-server --watch db.json --port 3000

Configure o endpoint no aplicativo para apontar para http://localhost:3000/senhas.

Execução do Projeto
Após instalar as dependências e configurar o json-server, execute o aplicativo com o comando:

Terminal flutter run

O aplicativo deve ser aberto no emulador/simulador, mostrando a tela de listagem de senhas.

Contribuição e Controle de Versão
Configurando o Git
Para contribuir, use o Git para versionamento. Execute os seguintes comandos para configurar o repositório:

Adicione o repositório remoto:

Terminal bash git remote add origin <URL_DO_SEU_REPOSITORIO>

Comite e envie as mudanças: Terminal bash git add . git commit -m "Mensagem do commit" git push origin main

Padrões de Código e Boas Práticas
Utilize o padrão de CamelCase para nomes de variáveis e classes.
Adicione comentários ao código para facilitar o entendimento.
Separe a lógica de UI e de dados para melhorar a manutenibilidade.
Considerações Finais
Este aplicativo é uma solução prática para gerenciamento de senhas e pode ser expandido com funcionalidades adicionais, como:

Integração com autenticação biométrica.
Criptografia para as senhas.
Filtros e busca na lista de senhas.