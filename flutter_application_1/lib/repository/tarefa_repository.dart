import '../model/tarefa_model.dart';

class TarefaRepository {
  static final List<Tarefa> _tarefas = [];

  static void adicionar(Tarefa tarefa) {
    _tarefas.add(tarefa);
  }

  static void editar(int index, Tarefa nova) {
    _tarefas[index] = nova;
  }

  static void remover(int index) {
    _tarefas.removeAt(index);
  }

  static void alternarConcluida(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;
  }

  static List<Tarefa> listarTodos() => List.unmodifiable(_tarefas);
}