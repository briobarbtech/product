import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var medida = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Productos"),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: medida.size.width * 0.40,
              child: ElevatedButton(
                child: const Text(
                  "Formulario",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  context.go('/form');
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: medida.size.width * 0.40,
              child: ElevatedButton(
                child: const Text(
                  "Lista de Items",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  context.go('/homepage');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
