import 'package:flutter/material.dart';
import '../../controller/tarefa_controller.dart';
import '../../model/tarefa_model.dart';

enum FiltroTarefa { todas, concluidas, pendentes }

class TarefaListView extends StatefulWidget {
  const TarefaListView({super.key});

  @override
  State<TarefaListView> createState() => _TarefaListViewState();
}

class _TarefaListViewState extends State<TarefaListView> {
  final controller = TarefaController();
  FiltroTarefa filtroSelecionado = FiltroTarefa.todas;
  String busca = '';

  List<Tarefa> get tarefasFiltradas {
    List<Tarefa> base;
    switch (filtroSelecionado) {
      case FiltroTarefa.concluidas:
        base = controller.tarefas.where((t) => t.concluida).toList();
        break;
      case FiltroTarefa.pendentes:
        base = controller.tarefas.where((t) => !t.concluida).toList();
        break;
      case FiltroTarefa.todas:
      // ignore: unreachable_switch_default
      default:
        base = controller.tarefas;
    }
    if (busca.isNotEmpty) {
      base = base
          .where((t) => t.titulo.toLowerCase().contains(busca.toLowerCase()))
          .toList();
    }
    return base;
  }

  void _editarTarefa(int index) {
    final indexOriginal = controller.tarefas.indexOf(tarefasFiltradas[index]);
    Navigator.pushNamed(
      context,
      '/editTarefa',
      arguments: indexOriginal,
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          DropdownButton<FiltroTarefa>(
            value: filtroSelecionado,
            onChanged: (valor) => setState(() => filtroSelecionado = valor!),
            items: const [
              DropdownMenuItem(
                value: FiltroTarefa.todas,
                child: Text('Todas'),
              ),
              DropdownMenuItem(
                value: FiltroTarefa.concluidas,
                child: Text('Concluídas'),
              ),
              DropdownMenuItem(
                value: FiltroTarefa.pendentes,
                child: Text('Pendentes'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Buscar por título',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() => busca = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefasFiltradas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefasFiltradas[index];
                return ListTile(
                  title: Text(tarefa.titulo),
                  subtitle: Text(tarefa.descricao),
                  leading: Checkbox(
                    value: tarefa.concluida,
                    onChanged: (value) {
                      final indexOriginal = controller.tarefas.indexOf(tarefa);
                      setState(() => controller.alternarConcluida(indexOriginal));
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editarTarefa(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          final indexOriginal = controller.tarefas.indexOf(tarefa);
                          setState(() => controller.remover(indexOriginal));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Tarefa removida')),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addTarefa')
            .then((_) => setState(() {})),
        child: const Icon(Icons.add),
      ),
    );
  }
}
