 import 'package:app_delivery/models/cart_item.dart';
import 'package:app_delivery/models/food.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{

  //list of food menu
  final List<Food> _menu=[
    //burger (aloha burger,bbq burger,blue moon burger,cheese burger,veggie burger)
    Food(
      name: 'Aloha Burger',
      imagePath: 'lib/images/burgers/aloha_burger.webp',
      price: 5.99,
      description: 'Grilled chicken, pineapple, swiss cheese, lettuce, tomato, and teriyaki sauce',
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    Food(
      name: 'BBQ Burger',
      imagePath: 'lib/images/burgers/barbeque_burger.webp',
      price: 6.99,
      description: 'Grilled beef, cheddar cheese, bacon, lettuce, tomato, and BBQ sauce',
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    Food(
      name: 'Blue Moon Burger',
      imagePath: 'lib/images/burgers/blue_moon_burger.webp',
      price: 7.99,
      description: 'Grilled beef, blue cheese, bacon, lettuce, tomato, and blue cheese sauce',
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    Food(
      name: 'Cheese Burger',
      imagePath: 'lib/images/burgers/cheese_burger.webp',
      price: 4.99,
      description: 'Grilled beef, cheddar cheese, lettuce, tomato, and mayo',
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      imagePath: 'lib/images/burgers/vege_burger.png',
      price: 3.99,
      description: 'Grilled veggie patty, swiss cheese, lettuce, tomato, and mayo',
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.99),
        Addon(name: 'Extra Patty', price: 2.99),
      ],
    ),
    //salad (caesar salad,greek salad,quinoa salad,sesame salad,south west salad)
    Food(
      name: 'Caesar Salad',
      imagePath: 'lib/images/salads/caesar_salad.jpg',
      price: 5.99,
      description: 'Romaine lettuce, croutons, parmesan cheese, and caesar dressing',
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Grilled Shrimp', price: 3.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      imagePath: 'lib/images/salads/greek_salad.jpg',
      price: 6.99,
      description: 'Romaine lettuce, kalamata olives, feta cheese, tomato, cucumber, and greek dressing',
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Grilled Shrimp', price: 3.99),
      ],
    ),
    Food(
      name: 'Quinoa Salad',
      imagePath: 'lib/images/salads/quinoa_salad.jpg',
      price: 7.99,
      description: 'Romaine lettuce, quinoa, chickpeas, avocado, tomato, and balsamic dressing',
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Grilled Shrimp', price: 3.99),
      ],
    ),
    Food(
      name: 'Sesame Salad',
      imagePath: 'lib/images/salads/sesame_salad.jpg',
      price: 4.99,
      description: 'Romaine lettuce, sesame seeds, crispy wonton, and sesame dressing',
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Grilled Shrimp', price: 3.99),
      ],
    ),
    Food(
      name: 'South West Salad',
      imagePath: 'lib/images/salads/southwest_salad.jpg',
      price: 3.99,
      description: 'Romaine lettuce, black beans, corn, tomato, avocado, and chipotle dressing',
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.99),
        Addon(name: 'Grilled Shrimp', price: 3.99),
      ],
    ),
    //sides
    Food(
      name: 'French Fries',
      imagePath: 'lib/images/sides/frenchfries.jpg',
      price: 2.99,
      description: 'Crispy fried potato',
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),
    Food(
      name: 'Onion Rings',
      imagePath: 'lib/images/sides/potato_sides.jpeg',
      price: 3.99,
      description: 'Crispy fried onion',
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),
    Food(
      name: 'Sweet Potato Fries',
      imagePath: 'lib/images/sides/sweetpotatoes.jpg',
      price: 4.99,
      description: 'Crispy fried sweet potato',
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),
    Food(
      name: 'Garlic Bread',
      imagePath: 'lib/images/sides/rice.jpg',
      price: 1.99,
      description: 'Toasted bread with garlic',
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),
    Food(
      name: 'Mozzarella Sticks',
      imagePath: 'lib/images/sides/tequeños.jpg',
      price: 5.99,
      description: 'Fried mozzarella cheese',
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: 'Cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.99),
      ],
    ),
    //drinks (cocktails,coffee,juices,smoothies,tea)
    Food(
      name: 'Mojito',
      imagePath: 'lib/images/drinks/cocktail.jpg',
      price: 7.99,
      description: 'Rum, sugar, lime juice, soda water, and mint',
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Rum', price: 2.99),
        Addon(name: 'Extra Mint', price: 0.99),
      ],
    ),
    Food(
      name: 'Espresso',
      imagePath: 'lib/images/drinks/coffee.JPG',
      price: 3.99,
      description: 'Strong black coffee',
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Shot', price: 1.99),
        Addon(name: 'Extra Sugar', price: 0.99),
      ],
    ),
    Food(
      name: 'Orange Juice',
      imagePath: 'lib/images/drinks/juice.jpg',
      price: 4.99,
      description: 'Freshly squeezed orange juice',
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Orange', price: 0.99),
        Addon(name: 'Extra Ice', price: 0.99),
      ],
    ),
    Food(
      name: 'Smoothie',
      imagePath: 'lib/images/drinks/smoothie.png',
      price: 5.99,
      description: 'Strawberry, banana, and yogurt',
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Strawberry', price: 0.99),
        Addon(name: 'Extra Banana', price: 0.99),
      ],
    ),
    Food(
      name: 'Green Tea',
      imagePath: 'lib/images/drinks/tea.jpg',
      price: 2.99,
      description: 'Green tea leaves',
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: 'Extra Tea Leaves', price: 0.99),
        Addon(name: 'Extra Sugar', price: 0.99),
      ],
    ),
    //desserts(brownies,budin,cake,ice cream,pie)
    Food(
      name: 'Brownies',
      imagePath: 'lib/images/desserts/brownie.jpg',
      price: 3.99,
      description: 'Chocolate brownies',
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.99),
        Addon(name: 'Chocolate Syrup', price: 0.99),
      ],
    ),
    Food(
      name: 'Bread Pudding',
      imagePath: 'lib/images/desserts/budin.jpg',
      price: 4.99,
      description: 'Bread pudding with vanilla ice cream',
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.99),
        Addon(name: 'Chocolate Syrup', price: 0.99),
      ],
    ),
    Food(
      name: 'Chocolate Cake',
      imagePath: 'lib/images/desserts/cake.jpg',
      price: 5.99,
      description: 'Chocolate cake with chocolate syrup',
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.99),
        Addon(name: 'Chocolate Syrup', price: 0.99),
      ],
    ),
    Food(
      name: 'Ice Cream',
      imagePath: 'lib/images/desserts/icecream.jpg',
      price: 2.99,
      description: 'Vanilla ice cream',
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Chocolate Syrup', price: 0.99),
        Addon(name: 'Sprinkles', price: 0.99),
      ],
    ),
    Food(
      name: 'Apple Pie',
      imagePath: 'lib/images/desserts/pie.jpg',
      price: 6.99,
      description: 'Apple pie with vanilla ice cream',
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: 'Vanilla Ice Cream', price: 1.99),
        Addon(name: 'Chocolate Syrup', price: 0.99),
      ],
    ),

  ];
  //user cart
  List<CartItem> _cart = [];
  //delivery address (which user can change)
  String _deliveryAddress = 'Jr. Manco Segundo 165, Lima, Peru';
  //GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //OPERATIONS
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //check if food is already in cart
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food is the same
      bool isSameFood = item.food == food;
      //check if addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    //if food is already in cart, increase quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      //if food is not in cart, add it
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }
  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1) {
      if(_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }
      else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }
  //get total price
  double get totalPrice {
    double total = 0.0;
    for(CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }
  //get total items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for(CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }
  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  //set delivery address
  void setDeliveryAddress(String address) {
    _deliveryAddress = address;
    notifyListeners();
  }
  //HELPERS
  //generate a recipe
  String displayCartRecipe() {
    final recipe = StringBuffer();
    recipe.writeln("Here's your recipe");
    //format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    recipe.writeln("Date: $formattedDate");
    recipe.writeln();
    recipe.writeln("-------------");
    for (final cartItem in cart){
      recipe.writeln("${cartItem.food.name} x ${cartItem.quantity}");
      recipe.writeln("Price: ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty) {
        recipe.writeln("Addons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      recipe.writeln("-------------");
    }
    recipe.writeln();
    recipe.writeln("Total Items: ${getTotalItemCount()}");
    recipe.writeln("Total Price: ${_formatPrice(totalPrice)}");
    recipe.writeln();
    recipe.writeln("Delivering to: $_deliveryAddress");

    return recipe.toString();
  }
  //format double value into money
  String _formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }
  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)}) ")
        .join(", ");
  }
 }