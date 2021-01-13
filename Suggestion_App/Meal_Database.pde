class Dish {
  //note: some of these variables are not used yet
  String name, price, spice, difficulty, kcal, time, mealType;
  String ingredient1, ingredient2, ingredient3, ingredient4, ingredient5, ingredient6;
  int rating, prepTime;
  boolean containsIngredient;

  //The constructor takes the name of the dish, and 6 ingredients as argument.
  Dish (String na, String mt, String pr, String diff, String sp, String kc, String tm, String in1, String in2, String in3, String in4, String in5, String in6) {
    name = na;
    mealType = mt;
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

void CheckDish(String mt) {
  println("checkdish");//
  for (int i=0; i<dishes.length; i++) {
    println("for loop");//
    if (dishes[i].mealType == mt) {
      println("if loop mealType");//
      if (mealLabel1.getStringValue() != "") {
        println("if loop mealLable1");//
        if (mealLabel2.getStringValue() != "") {
          println("if loop mealLabel2");//
          if (mealLabel3.getStringValue() != "") {
            println("if loop mealLabel3");//
            return;
          } else {
            mealLabel3.setValue(dishes[i].name);
            println(dishes[i].name);//
          }
        } else {
          mealLabel2.setValue(dishes[i].name);
          println(dishes[i].name);//
        }
      } else {
        mealLabel1.setValue(dishes[i].name);
        println(dishes[i].name);//
      }
    }
  }
}

void InitiateMealDatabase() {
  //add dishes to the dishes array
  //careful: be sure to spellcheck the ingredients, as they have to match in all dishes
  //   Exact spelling of some common ingredients: 
  //   Noodles, Potatoes, Rice, Chicken, Beef, Pork, Eggs, Beans, Carrots, Onion, Tomatoes, Soy Sauce, Bell Pepper, Lettuce
  //   Structure: Name, meal type (meat/vegetarian/potato/rice/pasta), Price ($ - $$$), Difficulty (1-5), Spicyness (1-3), Kcal, Cooking time, Ingredients 1-6
  dishes[0] = new Dish("Jamaican Jerk Chicken", "meat", "$$$", "5", "3", "680", "90", "Chicken", "", "", "", "", "");
  dishes[1] = new Dish("Pasta Salad", "vegetarian", "$", "2", "1", "720", "20", "Kielbasa", "Noodles", "", "", "", "");
  dishes[2] = new Dish("Lasagna", "pasta", "$$", "4", "2", "645", "60", "Sausage", "Noodles", "", "", "", "");
  dishes[3] = new Dish("Hearty Pancakes", "vegetarian", "$", "2", "1", "810", "20", "Milk", "Eggs", "Corn Meal", "", "", "");
  dishes[4] = new Dish("Spaghetti", "pasta", "$", "2", "1", "590", "25", "Noodles", "Marinara Sauce", "", "", "", "");
  dishes[5] = new Dish("White beans, tomatoes, and spinach", "vegetarian", "$", "1", "1", "580", "20", "Rice", "Vegetarian", "Beans", "Eggs", "", "");
  dishes[6] = new Dish("Cashew Chicken with Noodles", "pasta", "$$$", "3", "1", "575", "30", "Noodles", "Chicken", "", "", "", "");
  dishes[7] = new Dish("Asian Shredded Beef", "rice", "$$$", "4", "2", "640", "60", "Beef", "Noodles", "", "", "", "");
  dishes[8] = new Dish("Shepherds Pie", "potato", "$$$", "5", "1", "930", "100", "Beef", "Potatoes", "", "", "", "");
  dishes[9] = new Dish("Thai Chicken", "rice", "$$", "3", "3", "710", "45", "Chicken", "Noodles", "Eggs", "", "", "");
  dishes[10] = new Dish("One Pot Chicken & Potatoes", "potato", "$$", "1", "1", "730", "40", "Potatoes", "Chicken", "Carrots", "Onion", "", "");
  dishes[11] = new Dish("Honey Lime Chicken", "meat", "$$", "2", "1", "680", "25", "Chicken", "Rice", "", "", "", "");
  dishes[12] = new Dish("Lentil Curry", "vegetarian", "$", "3", "1", "620", "60", "Lentils", "Carrots", "Onion", "", "", "");
  dishes[13] = new Dish("Potato Apple Roast", "potato", "$", "4", "1", "560", "50", "Apple", "Potatoes", "Ham", "", "", "");
  dishes[14] = new Dish("Pasta Puttanesca", "pasta", "$$$", "5", "2", "710", "30", "Noodles", "Tomatoes", "Bacon", "Cheese", "", "");
  dishes[15] = new Dish("Potato Curry", "potato", "$", "2", "3", "740", "45", "Potatoes", "Vegetarian", "", "", "", "");
  dishes[16] = new Dish("Balsamic Dijon Root Vegetables", "vegetarian", "$$", "4", "1", "540", "35", "Potatoes", "Onion", "Carrots", "Parsnips", "", "");
  dishes[17] = new Dish("Best Baked Chicken Legs", "meat", "$$", "1", "2", "600", "30", "Chicken", "Rice", "", "", "", "");
  dishes[18] = new Dish("Chickpea Broccoli Pesto", "vegetarian", "$$", "1", "1", "640", "40", "Broccoli", "Chickpeas", "", "", "", "");
  dishes[19] = new Dish("Soy Mustard Salmon", "meat", "$$$", "3", "1", "590", "60", "Salmon", "Soy Sauce", "Dijon Mustard", "Garlic", "Ginger", "");
  dishes[20] = new Dish("Swedish Meatballs", "meat", "$$", "3", "1", "740", "75", "Beef", "Noodles", "Eggs", "", "", "");
  dishes[21] = new Dish("Southwest Beef & Rice Skillet", "meat", "$$$", "5", "2", "940", "70", "Beef", "Rice", "Beans", "", "", "");
  dishes[22] = new Dish("Fried Rice", "rice", "$", "2", "1", "820", "30", "Chicken", "Eggs", "Rice", "", "", "");
  dishes[23] = new Dish("Baked Cheddag Eggs & Potatoes", "potato", "$$", "1", "1", "680", "25", "Potatoes", "Bacon", "Cheese", "Eggs", "", "");
  dishes[24] = new Dish("Ravioli with Snap Peas", "pasta", "$", "2", "1", "720", "25", "Noodles", "Milk", "Cheese", "", "", "");
  dishes[25] = new Dish("Tostadas", "meat", "$$", "2", "1", "540", "15", "Chicken", "Cheese", "", "", "", "");
  dishes[26] = new Dish("Paprika Pork with Roasted Potatoes and Dill Cream", "meat", "$$", "3", "3", "620", "45", "Pork", "Potatoes", "", "", "", "");
  dishes[27] = new Dish("Pork and Veggie Stir Fry", "meat", "$$", "2", "2", "640", "50", "Rice", "Pork", "Mushrooms", "Carrots", "Bell Pepper", "Onion"); //https://www.goodhousekeeping.com/food-recipes/easy/a28639176/pork-and-veggie-stir-fry-recipe/
  dishes[28] = new Dish("Pork Chops with Bok Choy and Coconut Rice", "meat", "$$$", "5", "2", "830", "60", "Soy Sauce", "Pork", "Rice", "Scallions", "Ginger", "Garlic"); //https://www.goodhousekeeping.com/food-recipes/easy/a29831862/pork-chops-with-bok-choy-and-coconut-rice-recipe/
  dishes[29] = new Dish("Quick Pork Ragu with Ravioli", "meat", "$$", "3", "1", "690", "25", "Ravioli", "Pork", "Garlic", "White Wine", "", ""); //https://www.goodhousekeeping.com/food-recipes/easy/a25657117/quick-pork-ragu-with-ravioli-recipe/
  dishes[30] = new Dish("Pork Chops with Bloody Mary Tomato Salad", "meat", "$$", "4", "1", "660", "50", "Tomatoes", "Celery", "Onion", "Pork", "Lettuce", ""); //https://www.goodhousekeeping.com/food-recipes/easy/a28469802/pork-chops-with-bloody-mary-tomato-salad-recipe/
  dishes[31] = new Dish("Fennel and Thyme Pork Roast with Root Vegetables", "vegetarian", "$", "3", "1", "640", "40", "Garlic", "Pork", "Potatoes", "Radishes", "Scallions", ""); //https://www.goodhousekeeping.com/food-recipes/a26767593/fennel-and-thyme-pork-roast-with-root-vegetables-recipe/
  dishes[32] = new Dish("Rice noodles with meatballs and bok choy", "rice", "$$", "2", "2", "760", "15", "Beef", "Noodles", "", "", "", "");
  dishes[33] = new Dish("Italian Fagoli Vegetable Soup", "vegetarian", "$", "4", "1", "360", "25", "Vegetarian", "Beans", "Noodles", "", "", "");
  dishes[34] = new Dish("Lentil Soup", "vegetarian", "$", "1", "1", "460", "25", "Lentils", "Vegetarian", "Carrots", "Onion", "", "");
  dishes[35] = new Dish("Chicken Ceasar salad", "meat", "$$", "1", "1", "640", "5", "Chicken", "Eggs", "Lettuce", "Cheese", "", "");
  dishes[36] = new Dish("Buttery herb chicken", "meat", "$$", "2", "2", "680", "20", "Chicken", "Rice", "", "", "", "");
  dishes[37] = new Dish("Pesto tomato penne", "vegetarian", "$", "1", "1", "680", "20", "Noodles", "Tomatoes", "Pesto", "", "", "");
  dishes[38] = new Dish("Pasta with salmon and dill", "pasta", "$$$", "1", "1", "730", "20", "Noodles", "Salmon", "Cream", "Dill", "", "");
  dishes[39] = new Dish("Baked potato with bacon", "potato", "$", "1", "1", "810", "30", "Potatoes", "Butter", "Pork", "", "", "");
  dishes[40] = new Dish("Porkchop with mashed potato and gravy", "meat", "$$", "2", "1", "830", "45", "Potatoes", "Pork", "", "", "", "");
  dishes[41] = new Dish("Homemade Chicken nuggets", "meat", "$", "2", "1", "790", "30", "Chicken", "Eggs", "Flour", "", "", "");
  dishes[42] = new Dish("Stuffed Bell pepper", "rice", "$$", "2", "2", "660", "30", "Bell pepper", "Rice", "Beef", "Onion", "", "");
  dishes[43] = new Dish("Cherry tomato avocado salad", "vegetarian", "$$", "2", "1", "590", "10", "Lettuce", "Avocado", "Tomatoes", "Onion", "Carrots", "Vegetarian");
  dishes[44] = new Dish("Greek salad", "vegetarian", "$", "2", "1", "670", "5", "Lettuce", "Tomatoes", "Cheese", "Onion", "", "");
  dishes[45] = new Dish("Beef burritos", "meat", "$", "2", "3", "800", "25", "Lettuce", "Beef", "Onion", "Garlic", "", "");
  dishes[46] = new Dish("Asian chicken green bean noodles", "meat", "$$", "3", "3", "700", "15", "Chicken", "Noodles", "Beans", "Soy Sauce", "", "");
  dishes[47] = new Dish("Boerenkool Stamppot", "potato", "$", "1", "1", "750", "45", "Potatoes", "Boerenkool", "Butter", "Milk", "", "");
  dishes[48] = new Dish("Pasta Carbonara", "pasta", "$", "3", "1", "820", "30", "Noodles", "Cheese", "Milk", "Pork", "Garlic", "");
  dishes[49] = new Dish("Salmon Sushi roll", "rice", "$$$", "4", "1", "590", "35", "Rice", "Salmon", "Soy Sauce", "Avocado", "", "");
}
