class Dish {
  //note: some of these variables are not used yet
  String name, price, spice, difficulty, kcal, time;
  String ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6;
  int rating, prepTime;
  boolean containsIngredient;

  //The constructor takes the name of the dish, and 6 ingredients as argument.
  Dish (String na, String pr, String diff, String sp, String kc, String tm, String in1, String in2, String in3, String in4, String in5, String in6) {
    name = na;
    price = pr;
    difficulty = diff;
    spice = sp;
    kcal = kc;
    time = tm;
    ingredient1 = in1;
    ingredient2 = in2;
    ingredient3 = in3;
    ingredient4 = in4;
    ingredient5 = in5;
    ingredient6 = in6;
  }
}

//CheckDish() takes the String of an ingredient as argument.
void CheckDish(String ingr) {

  //loop through the ingredients of all dishes to check for a match. Set the value of the dishlabels to the dishes that contain the ingredient
  for (int i=0; i<dishes.length; i++) {
    if (dishes[i].ingredient1 == ingr || dishes[i].ingredient2 == ingr || dishes[i].ingredient3 == ingr || dishes[i].ingredient4 == ingr || dishes[i].ingredient5 == ingr || dishes[i].ingredient6 == ingr) {
      dishes[i].containsIngredient = true;
      //print(dishes[i].name + "\n"); //test
      if (dishlabel1.getStringValue() != "") {
        if (dishlabel2.getStringValue() != "") {
          if (dishlabel3.getStringValue() != "") {
            if (dishlabel4.getStringValue() != "") {
              if (dishlabel5.getStringValue() != "") {
                return;  //if there are already 5 dishes listed with the particular ingredient, do nothing
              } else {
                dishlabel5.setValue(dishes[i].name);
              }
            } else {
              dishlabel4.setValue(dishes[i].name);
            }
          } else {
            dishlabel3.setValue(dishes[i].name);
          }
        } else {
          dishlabel2.setValue(dishes[i].name);
        }
      } else {
        dishlabel1.setValue(dishes[i].name);
      }
    }
  }
}

//sets the 5 dishlabels to a random dish
void PickRandomDish() {
  r1 = int(random(50));
  r2 = int(random(50));
  r3 = int(random(50));
  r4 = int(random(50));
  r5 = int(random(50));

  //this loop makes sure that multiple dishlabels don't display the same dish
  while ((r2 == r1 || r2 == r3 || r2 == r4 || r2 == r5) || (r3 == r1 || r3 == r4 || r3 == r5) || (r4 == r1 || r4 == r5) || (r5 == r1)) {
    r2 = int(random(50));
    r3 = int(random(50));
    r4 = int(random(50));
    r5 = int(random(50));
  }  
  dishlabel1.setValue("1: " + dishes[r1].name);
  dishlabel2.setValue("2: " + dishes[r2].name);
  dishlabel3.setValue("3: " + dishes[r3].name);
  dishlabel4.setValue("4: " + dishes[r4].name);
  dishlabel5.setValue("5: " + dishes[r5].name);
  
  priceLabel1.setValue("price: " + dishes[r1].price);
  difficultyLabel1.setValue("difficulty: " + dishes[r1].difficulty);
  spicynessLabel1.setValue("spicy: " + dishes[r1].spice);
  kcalLabel1.setValue("kcal: " + dishes[r1].kcal);
  timetocookLabel1.setValue("time: " + dishes[r1].time);
  
  priceLabel2.setValue("price: " + dishes[r2].price);
  difficultyLabel2.setValue("difficulty: " + dishes[r2].difficulty);
  spicynessLabel2.setValue("spicy: " + dishes[r2].spice);
  kcalLabel2.setValue("kcal: " + dishes[r2].kcal);
  timetocookLabel2.setValue("time: " + dishes[r2].time);
  
  priceLabel3.setValue("price: " + dishes[r3].price);
  difficultyLabel3.setValue("difficulty: " + dishes[r3].difficulty);
  spicynessLabel3.setValue("spicy: " + dishes[r3].spice);
  kcalLabel3.setValue("kcal: " + dishes[r3].kcal);
  timetocookLabel3.setValue("time: " + dishes[r3].time);
  
  priceLabel4.setValue("price: " + dishes[r4].price);
  difficultyLabel4.setValue("difficulty: " + dishes[r4].difficulty);
  spicynessLabel4.setValue("spicy: " + dishes[r4].spice);
  kcalLabel4.setValue("kcal: " + dishes[r4].kcal);
  timetocookLabel4.setValue("time: " + dishes[r4].time);
  
  priceLabel5.setValue("price: " + dishes[r5].price);
  difficultyLabel5.setValue("difficulty: " + dishes[r5].difficulty);
  spicynessLabel5.setValue("spicy: " + dishes[r5].spice);
  kcalLabel5.setValue("kcal: " + dishes[r5].kcal);
  timetocookLabel5.setValue("time: " + dishes[r5].time);
}
