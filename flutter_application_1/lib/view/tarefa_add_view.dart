import 'package:flutter/material.dart';
import '../../controller/tarefa_controller.dart';
import '../../model/tarefa_model.dart';

class TarefaAddView extends StatefulWidget {
  const TarefaAddView({super.key});

  @override
  State<TarefaAddView> createState() => _TarefaAddViewState();
}

class _TarefaAddViewState extends State<TarefaAddView> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _controller = TarefaController();

  void _salvarTarefa() {
    if (_formKey.currentState!.validate()) {
      final novaTarefa = Tarefa(
        titulo: _tituloController.text,
        descricao: _descricaoController.text,
      );

      _controller.adicionar(novaTarefa);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tarefa adicionada com sucesso')),
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
      appBar: AppBar(title: const Text('Adicionar Tarefa')),
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
                onPressed: _salvarTarefa,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
