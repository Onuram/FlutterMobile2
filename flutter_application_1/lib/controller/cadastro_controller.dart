import '../model/usuario_model.dart';
import '../repository/usuario_repository.dart';

class CadastroController {
  String nome = '';
  String email = '';
  String senha = '';
  String confirmarSenha = '';

  bool validarCampos() {
    return nome.isNotEmpty &&
        email.contains('@') &&
        senha.isNotEmpty &&
        senha == confirmarSenha;
  }

  String? verificarErros() {
    if (nome.isEmpty) return 'Informe seu nome';
    if (!email.contains('@')) return 'Email inválido';
    if (senha.isEmpty || confirmarSenha.isEmpty) return 'Informe a senha';
    if (senha != confirmarSenha) return 'As senhas não coincidem';
    return null;
  }

  void salvarCadastro() {
    final usuario = Usuario(
      nome: nome,
      email: email,
      senha: senha,
    );
    UsuarioRepository.adicionar(usuario);
  }
}
