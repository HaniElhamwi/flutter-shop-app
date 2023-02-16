import 'package:flutter/material.dart';
import 'package:flutter_shop_app/provider/cart.dart';
import 'package:flutter_shop_app/screen/cart_screen.dart';
import 'package:flutter_shop_app/screen/order_screen.dart';
import 'package:flutter_shop_app/screen/product_detail_screen.dart';
import 'package:flutter_shop_app/screen/products_overview-screen.dart';
import './provider/products.dart';
import 'package:provider/provider.dart';
import './provider/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => Products()),
          ChangeNotifierProvider(create: (c) => Cart()),
          ChangeNotifierProvider(
            create: (ct) => Orders(),
          )
        ],
        child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            OrdersScreen.routeName : (ctx)=>OrdersScreen()
          },
        ));
  }
}
