import 'package:flutter/material.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/provider_dependency.dart';
import 'package:go_router/go_router.dart';

class EditProductPage extends StatelessWidget {
  final ProductModel product;
  const EditProductPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keyForm = GlobalKey();
    final id = TextEditingController(text: product.id.toString());
    final name = TextEditingController(text: product.name);
    final price = TextEditingController(text: product.price);
    final quantity = TextEditingController(text: product.quantity);
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
                      TextFormField(
                        decoration: const InputDecoration(labelText: "ID"),
                        readOnly: true,
                        controller: id,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresar el id del producto a agregar';
                          } else {
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Nombre"),
                        //initialValue: product.name,
                        controller: name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresar el nombre del producto a agregar';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(labelText: "Precio"),
                        //initialValue: product.price,
                        controller: price,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresar un precio';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Cantidad"),
                        //initialValue: product.quantity,
                        controller: quantity,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor, ingresar una cantidad válida';
                          } else {
                            return null;
                          }
                        },
                      )
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
                          child: const Text("Enviar"),
                          onPressed: () {
                            // Enviar formulario
                            ProductModel producto = ProductModel(
                              id: product.id,
                              name: name.text,
                              price: price.text,
                              quantity: quantity.text,
                            );
                            productUseCasePut.putProduct(producto);
                          },
                        ),
                        ElevatedButton(
                            onPressed: () {
                              context.goNamed('details', extra: product);
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
