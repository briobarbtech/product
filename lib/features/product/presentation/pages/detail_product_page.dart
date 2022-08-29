import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:go_router/go_router.dart';

class DetailProductPage extends ConsumerWidget {
  final ProductModel product;
  const DetailProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detalles")),
        body: /* data.when(
          data: (data) {
            return Center(
                child: Column(
              children: [
                Text(data.name),
                const SizedBox(
                  height: 20.0,
                ),
                Text(data.price),
                const SizedBox(
                  height: 20.0,
                ),
                Text(data.quantity),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ));
          },
          error: (e, s) => const Center(
                child: Text("Ups! Ocurrió un error"),
              ),
          loading: () => const CircularProgressIndicator()), */
            Center(
                child: Column(children: [
          Text(product.id.toString()),
          const SizedBox(
            height: 20.0,
          ),
          Text(product.name),
          const SizedBox(
            height: 20.0,
          ),
          Text(product.price),
          const SizedBox(
            height: 20.0,
          ),
          Text(product.quantity),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/editar', extra: product);
              },
              child: const Text("Editar"))
        ])));
  }
}
