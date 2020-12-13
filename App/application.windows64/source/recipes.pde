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
  dishlabel1.setValue(dishes[r1].name);
  dishlabel2.setValue(dishes[r2].name);
  dishlabel3.setValue(dishes[r3].name);
  dishlabel4.setValue(dishes[r4].name);
  dishlabel5.setValue(dishes[r5].name);
}
