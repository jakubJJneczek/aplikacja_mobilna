import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:aplikacja_mobilna/coffee_list_tile.dart';
import 'package:http/http.dart' as http;
import 'cart.dart';
import 'coffee.dart';

class IcedCoffee extends StatefulWidget {
  const IcedCoffee({
    super.key,
  });

  @override
  State<IcedCoffee> createState() => _IcedCoffee();
}

class _IcedCoffee extends State<IcedCoffee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(62, 15, 27, 1),
          title: const Text('Iced Coffee'),
          centerTitle: true,
        ),
        body: buildFutureBuilder());
  }
}

FutureBuilder<List<Coffee>> buildFutureBuilder() {
  return FutureBuilder(
      future: fetchCoffee(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final coffees = snapshot.data;
        if (snapshot.hasData) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return CoffeeListTile(coffee: coffees[index]);
            },
            itemCount: coffees.length,
          );
        } else {
          return Container();
        }
      });
}

Future<List<Coffee>> fetchCoffee() async {
  final response =
      await http.get(Uri.parse("https://api.sampleapis.com/coffee/iced"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<Coffee> listOfCoffee =
        List<Coffee>.from(data.map((item) => Coffee.fromJson(item)));
    return listOfCoffee;
  } else {
    throw Exception("error");
  }
}
