import 'dart:convert';
import 'package:aplikacja_mobilna/coffee_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'coffee.dart';

class HotCoffee extends StatefulWidget {
  const HotCoffee({
    super.key,
  });

  @override
  State<HotCoffee> createState() => _HotCoffee();
}

class _HotCoffee extends State<HotCoffee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(111, 42, 59, 1),
          title: const Text('Hot Coffee'),
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
            itemCount: 20,
          );
        } else {
          return Container();
        }
      });
}

Future<List<Coffee>> fetchCoffee() async {
  final response =
      await http.get(Uri.parse("https://api.sampleapis.com/coffee/hot"));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    List<Coffee> listOfCoffee =
        List<Coffee>.from(data.map((item) => Coffee.fromJson(item)));
    return listOfCoffee;
  } else {
    throw Exception("error");
  }
}
