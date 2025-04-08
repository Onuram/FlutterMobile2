import '../model/tarefa_model.dart';
import '../repository/tarefa_repository.dart';

class TarefaController {
  List<Tarefa> get tarefas => TarefaRepository.listarTodos();

  void adicionar(Tarefa tarefa) => TarefaRepository.adicionar(tarefa);
  void editar(int index, Tarefa tarefa) => TarefaRepository.editar(index, tarefa);
  void remover(int index) => TarefaRepository.remover(index);
  void alternarConcluida(int index) => TarefaRepository.alternarConcluida(index);
}
