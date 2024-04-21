import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class Shop extends StatefulWidget {
  const Shop({
    super.key,
  });

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Koszyk"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
            /* title: Text(cart.items[index].title),
          subtitle: Text(cart.items[index].quantityCoffeeString),*/
            );
      }),
    );
  }
}
