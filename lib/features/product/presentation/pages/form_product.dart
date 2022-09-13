import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product_state.dart';
import 'package:proy_productos_v1/features/product/presentation/widgets/text_field_form.dart';
import 'package:proy_productos_v1/provider_dependency.dart';

class FormularioProducto extends ConsumerWidget {
  const FormularioProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> keyForm = GlobalKey();
    final name = TextEditingController();
    final price = TextEditingController();
    final quantity = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registrar'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Form(
              key: keyForm,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 200.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldForm(
                        controller: name,
                        label: "Nombre",
                      ),
                      const SizedBox(height: 20.0),
                      TextFieldForm(
                        controller: price,
                        label: "Precio",
                      ),
                      const SizedBox(height: 20.0),
                      TextFieldForm(
                        controller: quantity,
                        label: "Cantidad",
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 300),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (keyForm.currentState!.validate()) {
                                ProductModel producto = ProductModel(
                                  id: 1,
                                  name: name.text,
                                  price: price.text,
                                  quantity: quantity.text,
                                );
                                final response =
                                    ref.read(postProductData(producto));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey[300])),
                            child: const Text(
                              "Guardar",
                              style: TextStyle(color: Colors.black),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.go('/');
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey[300])),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ))
                      ]),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
