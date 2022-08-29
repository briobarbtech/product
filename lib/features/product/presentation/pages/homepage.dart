import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/provider_dependency.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProduct = ref.watch(getProductData);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: dataProduct.when(
          data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].name),
                    onTap: () => context.go('/details', extra: data[index]),
                  )),
          error: (e, s) => const Center(
            child: Text('Ups, sucedio un error!'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
