import 'package:flutter/material.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Lista de Tarefas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Objetivo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Este aplicativo tem como objetivo auxiliar os usuários a organizarem suas tarefas diárias de forma simples e eficiente.',
            ),
            SizedBox(height: 24),
            Text(
              'Integrantes:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('• Guilherme S Maruno - 836781'),
          ],
        ),
      ),
    );
  }
}
