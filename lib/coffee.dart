class Coffee {
  final String title;
  final String description;
  final List<dynamic> ingredients;
  final String image;
  final int quantityCoffee;
  String get quantityCoffeeString => quantityCoffee.toString();

  Coffee({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
    required this.quantityCoffee,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      title: json['title'],
      description: json['description'],
      ingredients: json['ingredients'],
      image: json['image'],
      quantityCoffee: 0,
    );
  }
}
