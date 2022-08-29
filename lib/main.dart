import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:proy_productos_v1/features/product/data/model/product_model.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/detail_product_page.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/edit_product_page.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/form_product.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/home.dart';
import 'package:proy_productos_v1/features/product/presentation/pages/homepage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: "Productos",
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Home(),
        routes: <GoRoute>[
          GoRoute(
            path: 'homepage',
            name: 'homepage',
            builder: (BuildContext context, GoRouterState state) =>
                const HomePage(),
          ),
          GoRoute(
              path: 'form',
              name: 'form',
              builder: (BuildContext context, GoRouterState state) =>
                  const FormularioProducto()),
          GoRoute(
            path: 'details',
            name: 'details',
            builder: (BuildContext context, GoRouterState state) {
              Object? product = state.extra;
              if (product != null && product is ProductModel) {
                return DetailProductPage(product);
              } else {
                return DetailProductPage(ProductModel(
                    id: 0, name: 'no name', price: '-', quantity: '-'));
              }
            },
          ),
          GoRoute(
            path: 'editar',
            name: 'editar',
            builder: (BuildContext context, GoRouterState state) {
              Object? product = state.extra;
              if (product != null && product is ProductModel) {
                return EditProductPage(product);
              } else {
                return EditProductPage(ProductModel(
                    id: 0, name: 'no name', price: '-', quantity: '-'));
              }
            },
          )
        ],
      ),
    ],
  );
}
