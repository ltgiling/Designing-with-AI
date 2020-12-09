class Dish {
  //note: some of these variables are not used yet
  String name, easeOfPrep, notes, type, link;
  String ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6;
  int rating, prepTime;
  boolean containsIngredient;

  //The constructor takes the name of the dish, and 6 ingredients as argument.
  Dish (String na, String in1, String in2, String in3, String in4, String in5, String in6) {
    name = na;
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
