import '../repository/usuario_repository.dart';

class LoginController {
  String email = '';
  String senha = '';

  bool autenticar(String email, String senha) {
    final usuarios = UsuarioRepository.listarTodos();
    return usuarios.any((u) => u.email == email && u.senha == senha);
  }
}
