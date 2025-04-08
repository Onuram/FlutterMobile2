import 'package:flutter/material.dart';
import '../../controller/tarefa_controller.dart';
import '../../model/tarefa_model.dart';

class TarefaEditView extends StatefulWidget {
  const TarefaEditView({super.key});

  @override
  State<TarefaEditView> createState() => _TarefaEditViewState();
}

class _TarefaEditViewState extends State<TarefaEditView> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _controller = TarefaController();
  late int indexParaEditar;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    indexParaEditar = ModalRoute.of(context)!.settings.arguments as int;
    final tarefa = _controller.tarefas[indexParaEditar];
    _tituloController.text = tarefa.titulo;
    _descricaoController.text = tarefa.descricao;
  }

  void _editarTarefa() {
    if (_formKey.currentState!.validate()) {
      final tarefaEditada = Tarefa(
        titulo: _tituloController.text,
        descricao: _descricaoController.text,
        concluida: _controller.tarefas[indexParaEditar].concluida,
      );

      _controller.editar(indexParaEditar, tarefaEditada);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tarefa atualizada com sucesso')),
      );

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Tarefa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Informe o título' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Informe a descrição'
                    : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _editarTarefa,
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
