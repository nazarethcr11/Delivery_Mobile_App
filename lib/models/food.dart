class Food {
  String name;
  String imagePath;
  double price;
  String description;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.category,
    required this.availableAddons,
  });
}

//food categories
enum FoodCategory {
  burgers,
  sides,
  drinks,
  salads,
  desserts,
}

//food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}