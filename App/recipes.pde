Dish d1 = new Dish("Jamaican Jerk Chicken", "Chicken", "", "", "", "", "");
  Dish d2 = new Dish("Pasta Salad", "Kielbasa", "Noodles", "", "", "", "");
  Dish d3 = new Dish("Lasagna", "Sausage", "Noodles", "", "", "", "");
  Dish d4 = new Dish("Hearty Pancakes", "Milk", "Eggs", "Corn Meal", "", "", "");
  Dish d5 = new Dish("Spaghetti", "Noodles", "Marinara Sauce", "", "", "", "");
  Dish d6 = new Dish("White beans, tomatoes, and spinach", "Rice", "Vegetarian", "Beans", "eggs", "", "");
  Dish d7 = new Dish("Cashew Chicken with Noodles", "Noodles", "Chicken", "", "", "", "");
  Dish d8 = new Dish("Asian Shredded Beef", "Beef", "Noodles", "", "", "", "");
  Dish d9 = new Dish("Shepherd's Pie", "Beef", "Potatoes", "", "", "", "");
  Dish d10 = new Dish("Thai Chicken", "Chicken", "Noodles", "Eggs", "", "", "");
  Dish d11 = new Dish("One Pot Chicken & Potatoes", "Potatoes", "Chicken", "Carrots", "Onion", "", "");
  Dish d12 = new Dish("Honey Lime Chicken", "Chicken", "Rice", "", "", "", "");
  Dish d13 = new Dish("Lentil Curry", "Lentils", "Carrots", "Onion", "", "", "");
  Dish d14 = new Dish("Potato Apple Roast", "Apple", "Potatoes", "Ham", "", "", "");
  Dish d15 = new Dish("Bucatini all'Amatriciana", "Noodles", "Tomatoes", "Bacon", "", "", "");
  Dish d16 = new Dish("Potato Currry", "Potatoes", "Vegetarian", "", "", "", "");
  Dish d17 = new Dish("Balsamic Dijon Root Vegetables", "Potatoes", "Onion", "Carrots", "Parsnips", "", "");
  Dish d18 = new Dish("Best Baked Chicken Legs", "Chicken", "Rice", "", "", "", "");
  Dish d19 = new Dish("Chickpea Broccoli Pesto", "Broccoli", "Chickpeas", "", "", "", "");
  Dish d20 = new Dish("Soy Mustard Salmon", "Salmon", "Soy Sauce", "Dijon Mustard", "Garlic", "Ginger", "");
  
  
  /*print(d20.name + "\n");
  print(d20.ingredient1);
  print(d20.ingredient2);
  print(d20.ingredient3);
  print(d20.ingredient4);
  print(d20.ingredient5);
  print(d20.ingredient6 + "\n");
  */
 // CheckDish("Noodles");
  
  

void CheckDish(String i) {
  boolean dish1, dish2, dish3, dish4, dish5;
  
  if ((d1.ingredient1 == i) || (d1.ingredient2 == i) || (d1.ingredient3 == i) || (d1.ingredient4 == i) || (d1.ingredient5 == i) || (d1.ingredient6 == i)) {
    d1.containsIngredient = true;
  } 
  if (d2.ingredient1 == i || d2.ingredient2 == i || d2.ingredient3 == i || d2.ingredient4 == i || d2.ingredient5 == i || d2.ingredient6 == i) {
    d2.containsIngredient = true;
  } 
  if (d3.ingredient1 == i || d3.ingredient2 == i || d3.ingredient3 == i || d3.ingredient4 == i || d3.ingredient5 == i || d3.ingredient6 == i) {
    d3.containsIngredient = true;
  } 
  if (d1.ingredient1 == i || d4.ingredient2 == i || d4.ingredient3 == i || d4.ingredient4 == i || d4.ingredient5 == i || d4.ingredient6 == i) {
    d4.containsIngredient = true;
  } 
  if (d5.ingredient1 == i || d5.ingredient2 == i || d5.ingredient3 == i || d5.ingredient4 == i || d5.ingredient5 == i || d5.ingredient6 == i) {
    d5.containsIngredient = true;
  }  
}

class Dish {
  String name, easeOfPrep, notes, type, link;
  String ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6;
  int rating, prepTime;
  boolean containsIngredient;
  
  Dish(String na, String in1, String in2, String in3, String in4, String in5, String in6) {
    name = na;
    ingredient1 = in1;
    ingredient2 = in2;
    ingredient3 = in3;
    ingredient4 = in4;
    ingredient5 = in5;
    ingredient6 = in6;
  }
}
