import 'package:flutter/material.dart';
import 'package:flutter_shop_app/provider/cart.dart';
import 'package:flutter_shop_app/provider/products.dart';
import 'package:flutter_shop_app/screen/cart_screen.dart';
import 'package:flutter_shop_app/widget/app_drawer.dart';
import 'package:flutter_shop_app/widget/badge.dart';
import 'package:flutter_shop_app/widget/productsGrid..dart';
import 'package:provider/provider.dart';
import '../screen/products_overview-screen.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showIsFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyShop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorite) {
                    _showIsFavorite = true;
                  } else {
                    _showIsFavorite = false;
                  }
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorite'),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text('show all'),
                  value: FilterOptions.All,
                ),
              ],
              icon: Icon(Icons.more_vert),
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => CustomBadge(
                  // ignore: sort_child_properties_last
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                  value: cart.itemCount.toString(),
                  color: Colors.red),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: ProductsGrid(_showIsFavorite));
  }
}
