import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/product_card.dart';
import 'package:proy_productos_v1/provider_dependency.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final dataProduct = ref.watch(getProductData);
    List<dynamic> formattedProducts = ref.watch(productProvider).products;
    bool isLoading = ref.watch(productProvider).isLoading;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: formattedProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          Product product = formattedProducts[index];

                          return ProductCard(product: product);
                        })),
              ));
  }
}
