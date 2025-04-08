import '../model/usuario_model.dart';

class UsuarioRepository {
  static final List<Usuario> _usuarios = [];

  static void adicionar(Usuario usuario) {
    _usuarios.add(usuario);
  }

  static List<Usuario> listarTodos() => List.unmodifiable(_usuarios);
}