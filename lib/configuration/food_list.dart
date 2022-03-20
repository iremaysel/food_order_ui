import 'package:food_order_ui/configuration/category.dart';
import 'package:food_order_ui/configuration/food.dart';

Future<List<Food>> bringTheFoods() async {
  var foodList = <Food>[];

  var f1 = Food(foodId: 1, foodName: "Chicken Curry Pasta", foodImageName: "assets/food/ChickenCurryPasta.jpg", foodCategory: "Chicken", foodPrice: "22");
  var f2 = Food(foodId: 2, foodName: "Explosion Burger", foodImageName: "assets/food/ExplosionBurger.jpg", foodCategory: "Fast Food", foodPrice: "15");
  var f3 = Food(foodId: 3, foodName: "Grilled Chicken", foodImageName: "assets/food/GrilledChicken.jpg", foodCategory: "Chicken", foodPrice: "30");
  var f4 = Food(foodId: 4, foodName: "Grilled Fish", foodImageName: "assets/food/GrilledFish.jpg", foodCategory: "Fish", foodPrice: "27");
  var f5 = Food(foodId: 5, foodName: "Heavenly Pizza", foodImageName: "assets/food/HeavenlyPizza.jpg", foodCategory: "Fast Food", foodPrice: "24");
  var f6 = Food(foodId: 6, foodName: "Mandarin Pancake", foodImageName: "assets/food/MandarinPancake.jpg", foodCategory: "Bakery", foodPrice: "19");
  var f7 = Food(foodId: 7, foodName: "Organic Mandarin", foodImageName: "assets/food/OrganicMandarin.jpg", foodCategory: "Fruit", foodPrice: "15");
  var f8 = Food(foodId: 8, foodName: "Organic Orange", foodImageName: "assets/food/OrganicOrange.jpg", foodCategory: "Fruit", foodPrice: "12");
  var f9 = Food(foodId: 9, foodName: "Raspberries Cake", foodImageName: "assets/food/RaspberriesCake.jpg", foodCategory: "Bakery", foodPrice: "28");

  foodList.add(f1);
  foodList.add(f2);
  foodList.add(f3);
  foodList.add(f4);
  foodList.add(f5);
  foodList.add(f6);
  foodList.add(f7);
  foodList.add(f8);
  foodList.add(f9);

  return foodList;
}

Future<List<Category>> bringTheCategory() async {
  var categoryList = <Category>[];

  var c1 = Category(categoryId: 1, categoryName: "Chicken", categoryImage: "assets/category/chicken.png");
  var c2 = Category(categoryId: 2, categoryName: "Bakery", categoryImage: "assets/category/bakery.png");
  var c3 = Category(categoryId: 3, categoryName: "Fast Food", categoryImage: "assets/category/fastfood.png");
  var c4 = Category(categoryId: 4, categoryName: "Fish", categoryImage: "assets/category/fish.png");
  var c5 = Category(categoryId: 5, categoryName: "Fruit", categoryImage: "assets/category/fruit.png");
  var c6 = Category(categoryId: 6, categoryName: "Soup", categoryImage: "assets/category/soup.png");
  var c7 = Category(categoryId: 7, categoryName: "Vegetable", categoryImage: "assets/category/vegetable.png");

  categoryList.add(c1);
  categoryList.add(c2);
  categoryList.add(c3);
  categoryList.add(c4);
  categoryList.add(c5);
  categoryList.add(c6);
  categoryList.add(c7);

  return categoryList;
}

