import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proy_productos_v1/features/product/domain/entities/product.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
                padding: const EdgeInsets.all(10),
                height: 200,
                color: const Color(0xfff7f7f7),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(children: <Widget>[
                            GestureDetector(
                                onTap: () => context.push('/${product.id}'),
                                child: Text(
                                    "${product.name} (${product.price})",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))),
                            const SizedBox(height: 10),
                            Spacer(),
                            Row(
                              children: [
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                    ),
                                    onPressed: () => {},
                                    child: Text("Edit")),
                                Padding(padding: EdgeInsets.all(15)),
                              ],
                            )
                          ])))
                ]))));
  }
}
/* 

deleteproduct(productId, WidgetRef ref, BuildContext context) {
  ref.read(productsProvider.notifier).deleteproduct(productId);
  Navigator.pop(context);
}

class StatefulBottomSheet extends ConsumerStatefulWidget {
  final product product;
  StatefulBottomSheet({Key? key, required this.product});

  @override
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends ConsumerState<StatefulBottomSheet> {
  late product product;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a title',
                  ),
                  initialValue: product.title,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    product.title = value;
                  }),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a year',
                  ),
                  initialValue: product.year,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    product.year = value;
                  }),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a description',
                  ),
                  initialValue: product.plot,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    product.plot = value;
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Navigator.pop(context);
                      /* ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      ); */

                      ref
                          .read(productsProvider.notifier)
                          .updateproduct(product.id, product.toJson());
                    }
                  },
                  child: const Text('Save Changes'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */