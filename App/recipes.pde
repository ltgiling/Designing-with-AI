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

void CheckDish(String i) {
  
  if (d1.ingredient1 == i || d1.ingredient2 == i || d1.ingredient3 == i || d1.ingredient4 == i || d1.ingredient5 == i || d1.ingredient6 == i) {
    d1.containsIngredient = true;
    print(d1.name + "\n");
  } 
  if (d2.ingredient1 == i || d2.ingredient2 == i || d2.ingredient3 == i || d2.ingredient4 == i || d2.ingredient5 == i || d2.ingredient6 == i) {
    d2.containsIngredient = true;
    print(d2.name + "\n");
  } 
  if (d3.ingredient1 == i || d3.ingredient2 == i || d3.ingredient3 == i || d3.ingredient4 == i || d3.ingredient5 == i || d3.ingredient6 == i) {
    d3.containsIngredient = true;
    print(d3.name + "\n");
  } 
  if (d1.ingredient1 == i || d4.ingredient2 == i || d4.ingredient3 == i || d4.ingredient4 == i || d4.ingredient5 == i || d4.ingredient6 == i) {
    d4.containsIngredient = true;
    print(d4.name + "\n");
  } 
  if (d5.ingredient1 == i || d5.ingredient2 == i || d5.ingredient3 == i || d5.ingredient4 == i || d5.ingredient5 == i || d5.ingredient6 == i) {
    d5.containsIngredient = true;
    print(d5.name + "\n");
  }
  if (d6.ingredient1 == i || d6.ingredient2 == i || d6.ingredient3 == i || d6.ingredient4 == i || d6.ingredient5 == i || d6.ingredient6 == i) {
    d6.containsIngredient = true;
    print(d6.name + "\n");
  }
  if (d7.ingredient1 == i || d7.ingredient2 == i || d7.ingredient3 == i || d7.ingredient4 == i || d7.ingredient5 == i || d7.ingredient6 == i) {
    d7.containsIngredient = true;
    print(d7.name + "\n");
  }
  if (d8.ingredient1 == i || d8.ingredient2 == i || d8.ingredient3 == i || d8.ingredient4 == i || d8.ingredient5 == i || d8.ingredient6 == i) {
    d8.containsIngredient = true;
    print(d8.name + "\n");
  }
  if (d9.ingredient1 == i || d9.ingredient2 == i || d9.ingredient3 == i || d9.ingredient4 == i || d9.ingredient5 == i || d9.ingredient6 == i) {
    d9.containsIngredient = true;
    print(d9.name + "\n");
  }
  if (d10.ingredient1 == i || d10.ingredient2 == i || d10.ingredient3 == i || d10.ingredient4 == i || d10.ingredient5 == i || d10.ingredient6 == i) {
    d10.containsIngredient = true;
    print(d10.name + "\n");
  }
  
}
