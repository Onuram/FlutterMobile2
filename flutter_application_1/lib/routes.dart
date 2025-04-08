import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'view/cadastro_view.dart';
import 'view/esqueceu_senha_view.dart';
import 'view/sobre_view.dart';
import 'view/home_view.dart';
import 'view/tarefa_list_view.dart';
import 'view/tarefa_add_view.dart';
import 'view/tarefa_edit_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginView(),
  '/cadastro': (context) => const CadastroView(),
  '/esqueceu': (context) => const EsqueceuSenhaView(),
  '/sobre': (context) => const SobreView(),
  '/home': (context) => const HomeView(),
  '/tarefas': (context) => const TarefaListView(),
  '/addTarefa': (context) => const TarefaAddView(),
  '/editTarefa': (context) => const TarefaEditView(),
};
