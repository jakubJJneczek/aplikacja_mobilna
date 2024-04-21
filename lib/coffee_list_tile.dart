import 'package:aplikacja_mobilna/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'coffee.dart';
import 'home.dart';

class CoffeeListTile extends StatefulWidget {
  final Coffee coffee;

  CoffeeListTile({Key? key, required this.coffee}) : super(key: key);

  @override
  State<CoffeeListTile> createState() => _CoffeeListTileState();
}

class _CoffeeListTileState extends State<CoffeeListTile> {
  bool isItemExpanded = false;

  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return ExpansionTile(
      onExpansionChanged: (bool isExpanded) {
        setState(() {
          isItemExpanded = isExpanded;
        });
      },
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      leading: Text(
        widget.coffee.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color.fromRGBO(62, 15, 27, 1),
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.coffee.image),
          ),
          const SizedBox(
            width: 15,
          ),
          isItemExpanded
              ? const Text(
                  "Zwiń",
                  style: TextStyle(
                    height: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(62, 15, 27, 1),
                  ),
                )
              : const Text(
                  "Sprawdź składniki",
                  style: TextStyle(
                    height: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(62, 15, 27, 1),
                  ),
                )
        ],
      ),
      children: [
        const SizedBox(height: 10),
        const Text(
          'Opis:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(widget.coffee.description),
        const SizedBox(height: 10),
        const Text(
          'Składniki:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(widget.coffee.ingredients.join(', ')),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  cart.addToCart(Coffee(
                      title: widget.coffee.title,
                      description: widget.coffee.description,
                      ingredients: widget.coffee.ingredients,
                      image: widget.coffee.image,
                      quantityCoffee: quantityCount));
                },
                child: const Text("Do koszyka"),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(162, 116, 72, 1),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: decrementQuantity,
                  ),
                ),
                SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      quantityCount.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: incrementQuantity,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
