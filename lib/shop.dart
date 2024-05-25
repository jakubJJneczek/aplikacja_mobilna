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
    final cart = context.watch<Cart>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(111, 42, 59, 1),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Koszyk"),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(cart.items[index].image),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  cart.items[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  cart.items[index].quantityCoffeeString,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Usunięto ${cart.items[index].title}"),
                  backgroundColor: Colors.red,
                ));
                cart.removeItemAtIndex(index);
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(62, 15, 27, 1),
        child: const Icon(
          Icons.remove_shopping_cart,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Wyczyszczono koszyk"),
            backgroundColor: Colors.red,
          ));
          cart.clearCart();
        },
      ),
    );
  }
}
