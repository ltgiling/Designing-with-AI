// ********************************************************
// Author: Lars G***** 
// Co-Authors: Mervyn F*****, Jeroen K*****
// Date: Dec. 13, 2020
// Description: Code  to  collect and parse cooking data of
//              users,  sending  interaction  data  to Data 
//              Foundry for providing personalized feedback
// ********************************************************

import java.util.Map;
import java.util.Calendar;
import controlP5.*;
import nl.tue.id.datafoundry.*;

// ------------------------------------------------------------------------
// settings for DataFoundry library
String host = "************";
String iot_api_token = "*************************";
String entity_api_token = "*************************";
long iot_id = ***;
long entity_id = ***;
// ------------------------------------------------------------------------

// data foundry connection
DataFoundry df = new DataFoundry(host);
// access to two datasets: iotDS and entityDS
DFDataset iotDS = df.dataset(iot_id, iot_api_token);
DFDataset entityDS = df.dataset(entity_id, entity_api_token);

Calendar cal = Calendar.getInstance();

// variables
String uname = "";
String acttime = "";
String userage = "";
String userweight = "";
String prefcuisine = "";
String usereducationlvl = ""; 
String userdietgoal = "";
String userdietpref = "";
String usergender = "";
String t_pref = "";
String t_base = "";
String base = "";
boolean isStart;
color bgColor;
int state;
int c_clicks;
int weekday;
//int Difficulty = 1;
//int Spiciness = 1;
//int spicyrating;
//float c_speed;
//String prefprice = "";
//String preftime = "";
//String prefkcal = "";
int Rating = 1;
int diffrating;
int housesize;
int rate;
int r1;
int r2;
int r3;
int r4;
int r5;

//create array of class (object) Dish (so it's easy to search through the dishes with a for-loop)
Dish[] dishes = new Dish[50];

// UI elements
ControlP5 cp5;
// Buttons
controlP5.Button submit;
controlP5.Button dish1;
controlP5.Button dish2;
controlP5.Button dish3;
controlP5.Button dish4;
controlP5.Button dish5;
//Textfields
controlP5.Textfield username;
controlP5.Textfield actualtime;
//controlP5.Textfield prefertime;
//controlP5.Textfield preferkcal;
//Textlabels
controlP5.Textlabel title;
controlP5.Textlabel timelabel;
controlP5.Textlabel timelabel2;
controlP5.Textlabel dishlabel1;
controlP5.Textlabel dishlabel2;
controlP5.Textlabel dishlabel3;
controlP5.Textlabel dishlabel4;
controlP5.Textlabel dishlabel5;
controlP5.Textlabel priceLabel1;
controlP5.Textlabel difficultyLabel1;
controlP5.Textlabel spicynessLabel1;
controlP5.Textlabel kcalLabel1;
controlP5.Textlabel timetocookLabel1;
controlP5.Textlabel priceLabel2;
controlP5.Textlabel difficultyLabel2;
controlP5.Textlabel spicynessLabel2;
controlP5.Textlabel kcalLabel2;
controlP5.Textlabel timetocookLabel2;
controlP5.Textlabel priceLabel3;
controlP5.Textlabel difficultyLabel3;
controlP5.Textlabel spicynessLabel3;
controlP5.Textlabel kcalLabel3;
controlP5.Textlabel timetocookLabel3;
controlP5.Textlabel priceLabel4;
controlP5.Textlabel difficultyLabel4;
controlP5.Textlabel spicynessLabel4;
controlP5.Textlabel kcalLabel4;
controlP5.Textlabel timetocookLabel4;
controlP5.Textlabel priceLabel5;
controlP5.Textlabel difficultyLabel5;
controlP5.Textlabel spicynessLabel5;
controlP5.Textlabel kcalLabel5;
controlP5.Textlabel timetocookLabel5;
//Scroll-lists
controlP5.ScrollableList cuisine;
controlP5.ScrollableList educationlvl;
controlP5.ScrollableList gender;
controlP5.ScrollableList dietgoal;
controlP5.ScrollableList dietpref;
controlP5.ScrollableList basis;
controlP5.ScrollableList age;
controlP5.ScrollableList weight;
controlP5.ScrollableList price;
//Slider
Slider abc;

// ------------------------------------------------------------------------
void setup() {
  // initiate canvas in mobile resolution
  size(375, 502);
  background(0);
  frameRate(20);
  noStroke();
  state = 0;  
  isStart = false;

  //add dishes to the dishes array
  //careful: be sure to spellcheck the ingredients, as they have to match in all dishes
  //   Exact spelling of some common ingredients: 
  //   Noodles, Potatoes, Rice, Chicken, Beef, Pork, Eggs, Beans, Carrots, Onion, Tomatoes, Soy Sauce, Bell Pepper, Lettuce
  //   Structure: Name, Price ($ - $$$), Difficulty (1-5), Spicyness (1-3), Kcal, Cooking time, Ingredients 1-6
  dishes[0] = new Dish("Jamaican Jerk Chicken", "$$$", "5", "3", "680", "90", "Chicken", "", "", "", "", "");
  dishes[1] = new Dish("Pasta Salad", "$", "2", "1", "720", "20", "Kielbasa", "Noodles", "", "", "", "");
  dishes[2] = new Dish("Lasagna", "$$", "4", "2", "645", "60", "Sausage", "Noodles", "", "", "", "");
  dishes[3] = new Dish("Hearty Pancakes", "$", "2", "1", "810", "20", "Milk", "Eggs", "Corn Meal", "", "", "");
  dishes[4] = new Dish("Spaghetti", "$", "2", "1", "590", "25", "Noodles", "Marinara Sauce", "", "", "", "");
  dishes[5] = new Dish("White beans, tomatoes, and spinach", "$", "1", "1", "580", "20", "Rice", "Vegetarian", "Beans", "Eggs", "", "");
  dishes[6] = new Dish("Cashew Chicken with Noodles", "$$$", "3", "1", "575", "30", "Noodles", "Chicken", "", "", "", "");
  dishes[7] = new Dish("Asian Shredded Beef", "$$$", "4", "2", "640", "60", "Beef", "Noodles", "", "", "", "");
  dishes[8] = new Dish("Shepherds Pie", "$$$", "5", "1", "930", "100", "Beef", "Potatoes", "", "", "", "");
  dishes[9] = new Dish("Thai Chicken", "$$", "3", "3", "710", "45", "Chicken", "Noodles", "Eggs", "", "", "");
  dishes[10] = new Dish("One Pot Chicken & Potatoes", "$$", "1", "1", "730", "40", "Potatoes", "Chicken", "Carrots", "Onion", "", "");
  dishes[11] = new Dish("Honey Lime Chicken", "$$", "2", "1", "680", "25", "Chicken", "Rice", "", "", "", "");
  dishes[12] = new Dish("Lentil Curry", "$", "3", "1", "620", "60", "Lentils", "Carrots", "Onion", "", "", "");
  dishes[13] = new Dish("Potato Apple Roast", "$", "4", "1", "560", "50", "Apple", "Potatoes", "Ham", "", "", "");
  dishes[14] = new Dish("Pasta Puttanesca", "$$$", "5", "2", "710", "30", "Noodles", "Tomatoes", "Bacon", "Cheese", "", "");
  dishes[15] = new Dish("Potato Curry", "$", "2", "3", "740", "45", "Potatoes", "Vegetarian", "", "", "", "");
  dishes[16] = new Dish("Balsamic Dijon Root Vegetables", "$$", "4", "1", "540", "35", "Potatoes", "Onion", "Carrots", "Parsnips", "", "");
  dishes[17] = new Dish("Best Baked Chicken Legs", "$$", "1", "2", "600", "30", "Chicken", "Rice", "", "", "", "");
  dishes[18] = new Dish("Chickpea Broccoli Pesto", "$$", "1", "1", "640", "40", "Broccoli", "Chickpeas", "", "", "", "");
  dishes[19] = new Dish("Soy Mustard Salmon", "$$$", "3", "1", "590", "60", "Salmon", "Soy Sauce", "Dijon Mustard", "Garlic", "Ginger", "");
  dishes[20] = new Dish("Swedish Meatballs", "$$", "3", "1", "740", "75", "Beef", "Noodles", "Eggs", "", "", "");
  dishes[21] = new Dish("Southwest Beef & Rice Skillet", "$$$", "5", "2", "940", "70", "Beef", "Rice", "Beans", "", "", "");
  dishes[22] = new Dish("Fried Rice", "$", "2", "1", "820", "30", "Chicken", "Eggs", "Rice", "", "", "");
  dishes[23] = new Dish("Baked Cheddag Eggs & Potatoes", "$$", "1", "1", "680", "25", "Potatoes", "Bacon", "Cheese", "Eggs", "", "");
  dishes[24] = new Dish("Ravioli with Snap Peas", "$", "2", "1", "720", "25", "Noodles", "Milk", "Cheese", "", "", "");
  dishes[25] = new Dish("Tostadas", "$$", "2", "1", "540", "15", "Chicken", "Cheese", "", "", "", "");
  dishes[26] = new Dish("Paprika Pork with Roasted Potatoes and Dill Cream", "$$", "3", "3", "620", "45", "Pork", "Potatoes", "", "", "", "");
  dishes[27] = new Dish("Pork and Veggie Stir Fry", "$$", "2", "2", "640", "50", "Rice", "Pork", "Mushrooms", "Carrots", "Bell Pepper", "Onion"); //https://www.goodhousekeeping.com/food-recipes/easy/a28639176/pork-and-veggie-stir-fry-recipe/
  dishes[28] = new Dish("Pork Chops with Bok Choy and Coconut Rice", "$$$", "5", "2", "830", "60", "Soy Sauce", "Pork", "Rice", "Scallions", "Ginger", "Garlic"); //https://www.goodhousekeeping.com/food-recipes/easy/a29831862/pork-chops-with-bok-choy-and-coconut-rice-recipe/
  dishes[29] = new Dish("Quick Pork Ragu with Ravioli", "$$", "3", "1", "690", "25", "Ravioli", "Pork", "Garlic", "White Wine", "", ""); //https://www.goodhousekeeping.com/food-recipes/easy/a25657117/quick-pork-ragu-with-ravioli-recipe/
  dishes[30] = new Dish("Pork Chops with Bloody Mary Tomato Salad", "$$", "4", "1", "660", "50", "Tomatoes", "Celery", "Onion", "Pork", "Lettuce", ""); //https://www.goodhousekeeping.com/food-recipes/easy/a28469802/pork-chops-with-bloody-mary-tomato-salad-recipe/
  dishes[31] = new Dish("Fennel and Thyme Pork Roast with Root Vegetables", "$", "3", "1", "640", "40", "Garlic", "Pork", "Potatoes", "Radishes", "Scallions", ""); //https://www.goodhousekeeping.com/food-recipes/a26767593/fennel-and-thyme-pork-roast-with-root-vegetables-recipe/
  dishes[32] = new Dish("Rice noodles with meatballs and bok choy", "$$", "2", "2", "760", "15", "Beef", "Noodles", "", "", "", "");
  dishes[33] = new Dish("Italian Fagoli Vegetable Soup", "$", "4", "1", "360", "25", "Vegetarian", "Beans", "Noodles", "", "", "");
  dishes[34] = new Dish("Lentil Soup", "$", "1", "1", "460", "25", "Lentils", "Vegetarian", "Carrots", "Onion", "", "");
  dishes[35] = new Dish("Chicken Ceasar salad", "$$", "1", "1", "640", "5", "Chicken", "Eggs", "Lettuce", "Cheese", "", "");
  dishes[36] = new Dish("Buttery herb chicken", "$$", "2", "2", "680", "20", "Chicken", "Rice", "", "", "", "");
  dishes[37] = new Dish("Pesto tomato penne", "$", "1", "1", "680", "20", "Noodles", "Tomatoes", "Pesto", "", "", "");
  dishes[38] = new Dish("Pasta with salmon and dill", "$$$", "1", "1", "730", "20", "Noodles", "Salmon", "Cream", "Dill", "", "");
  dishes[39] = new Dish("Baked potato with bacon", "$", "1", "1", "810", "30", "Potatoes", "Butter", "Pork", "", "", "");
  dishes[40] = new Dish("Porkchop with mashed potato and gravy", "$$", "2", "1", "830", "45", "Potatoes", "Pork", "", "", "", "");
  dishes[41] = new Dish("Homemade Chicken nuggets", "$", "2", "1", "790", "30", "Chicken", "Eggs", "Flour", "", "", "");
  dishes[42] = new Dish("Stuffed Bell pepper", "$$", "2", "2", "660", "30", "Bell pepper", "Rice", "Beef", "Onion", "", "");
  dishes[43] = new Dish("Cherry tomato avocado salad", "$$", "2", "1", "590", "10", "Lettuce", "Avocado", "Tomatoes", "Onion", "Carrots", "Vegetarian");
  dishes[44] = new Dish("Greek salad", "$", "2", "1", "670", "5", "Lettuce", "Tomatoes", "Cheese", "Onion", "", "");
  dishes[45] = new Dish("Beef burritos", "$", "2", "3", "800", "25", "Lettuce", "Beef", "Onion", "Garlic", "", "");
  dishes[46] = new Dish("Asian chicken green bean noodles", "$$", "3", "3", "700", "15", "Chicken", "Noodles", "Beans", "Soy Sauce", "", "");
  dishes[47] = new Dish("Boerenkool Stamppot", "$", "1", "1", "750", "45", "Potatoes", "Boerenkool", "Butter", "Milk", "", "");
  dishes[48] = new Dish("Pasta Carbonara", "$", "3", "1", "820", "30", "Noodles", "Cheese", "Milk", "Pork", "Garlic", "");
  dishes[49] = new Dish("Salmon Sushi roll", "$$$", "4", "1", "590", "35", "Rice", "Salmon", "Soy Sauce", "Avocado", "", "");

  // initiate ControlerP5
  Label.setUpperCaseDefault(false);
  cp5 = new ControlP5(this);
  // all of the components (buttons, fields, dropdown menu's)
  cp5components();
  interface1();
  weekday = cal.get(Calendar.DAY_OF_WEEK);
}
// ------------------------------------------------------------------------
//very basic draw method of just the background
void draw() {
  background(0);
}
// ------------------------------------------------------------------------
//On submit button press
public void submit() {
  /********************************************************************************************/
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  
  //if the user has not cooked yet (start interface)
  if (state == 0) {
    //collect values from the boxes (see helpers tab)
    setUname();

    //print results in console
    print("\nusername: " + uname, "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      //Dropdown
      .data("gender", usergender)
      .data("dietgoal", userdietgoal)
      .data("dietpref", userdietpref)
      .data("educationlvl", usereducationlvl)
      //Open questions
      .data("age", userage)
      .data("a_weight", userweight)
      //Sliders
      .data("Householdsize", housesize)
      .update();

    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      //Data that gets checked automatically
      .data("weekday (sun-sat)", weekday)
      //Data filled in by user
      //Dropdowns
      .data("gender", usergender)
      .data("dietgoal", userdietgoal)
      .data("dietpref", userdietpref)
      .data("educationlvl", usereducationlvl)
      //Open questions
      .data("age", userage)
      .data("a_weight", userweight)
      //Sliders
      .data("Householdsize", housesize)
      .log(); 
    setButtonStyle(submit, font, "Submit"); 
    //Switch interface after Submit
    interface2();
    state = 1;
    return;
  }
  /********************************************************************************************/
  //if the user has not cooked yet (start interface)
  if (state == 1) {
    //collect values from the boxes (see helpers tab)
    setActual();
    //fetchData();

    //print results in console
    print("\nusername: " + uname, "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      //.data("preferred time", preftime)
      //.data("preferred kcal", prefkcal)
      .data("cuisine", prefcuisine)
      //.data("price", prefprice)
      .data("base ingredient", base)
      //.data("difficulty", diffrating)
      //.data("Spiciness", spicyrating)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      //.data("preferred time", preftime)
      //.data("preferred kcal", prefkcal)
      .data("cuisine", prefcuisine)
      //.data("price", prefprice)
      .data("dietgoal", userdietgoal)
      .data("gender", usergender)
      .data("weekday (sun-sat)", weekday)
      //.data("difficulty", diffrating)
      //.data("Spiciness", spicyrating)
      .log();

    //CheckDish(base); was used before to suggest meals with a certain ingredient
    PickRandomDish();

    //Switch interface after Submit
    setButtonStyle(submit, font, "<continue with \n5 buttons>"); 
    interface3();
    state = 2;
    return;
  }
  /********************************************************************************************/
  //if the user has cooked (second interface) and submits
  if (state == 2) {
    //collect data from entries and data foundry
    setActual();
    //fetchData();

    //print results of entries and calculations
    print("\nusername: " + uname, "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("weekday (sun-sat)", weekday)
      .log();  
    setButtonStyle(submit, font, "Return");  
    //Switch interface after Submit
    interface4();
    state = 3;
    return;
  }
  /********************************************************************************************/
  if (state == 3) {
    //collect data from entries and data foundry
    setActual();
    //fetchData();

    //print results of entries and calculations
    print("\nusername: " + uname, "\nrating: " + rate, "\nactual time: " + acttime);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      //Data filled in by user
      //Sliders
      .data("rating", rate)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      //Data that gets checked automatically
      .data("weekday (sun-sat)", weekday)
      //Data filled in by user
      //Sliders
      .data("rating", rate)
      .log();

    //Switch interface after Submit
    setButtonStyle(submit, font, "Continue");
    interface1();
    state = 0;
    return;
  }
  /********************************************************************************************/
}

public void dish1() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  

  if (state == 2) {

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .data("meal choice", dishes[r1].name)
      .data("meal price", dishes[r1].price)
      .data("meal Spicyness", dishes[r1].spice)
      .data("meal difficulty", dishes[r1].difficulty)
      .data("meal kcal", dishes[r1].kcal)
      .data("meal cooking time", dishes[r1].time)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("meal choice", dishes[r1].name)
      .data("weekday (sun-sat)", weekday)
      .log();  
    setButtonStyle(submit, font, "Return");  
    //Switch interface after Submit
    interface4();
    cp5.getController("dishlabel1").show();
    state = 3;
    return;
  }
}

public void dish2() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  

  if (state == 2) {

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .data("meal choice", dishes[r2].name)
      .data("meal price", dishes[r2].price)
      .data("meal Spicyness", dishes[r2].spice)
      .data("meal difficulty", dishes[r2].difficulty)
      .data("meal kcal", dishes[r2].kcal)
      .data("meal cooking time", dishes[r2].time)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("meal choice", dishes[r2].name)
      .data("weekday (sun-sat)", weekday)
      .log();  
    setButtonStyle(submit, font, "Return");  
    //Switch interface after Submit
    interface4();
        cp5.getController("dishlabel2").show();
    state = 3;
    return;
  }
}

public void dish3() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  
  //price, spice, difficulty, kcal, time;
  if (state == 2) {
    print(dishes[r3].price);
    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .data("meal choice", dishes[r3].name)
      .data("meal price", dishes[r3].price)
      .data("meal Spicyness", dishes[r3].spice)
      .data("meal difficulty", dishes[r3].difficulty)
      .data("meal kcal", dishes[r3].kcal)
      .data("meal cooking time", dishes[r3].time)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("meal choice", dishes[r3].name)
      .data("weekday (sun-sat)", weekday)
      .log();  
    setButtonStyle(submit, font, "Return");  
    //Switch interface after Submit
    interface4();
        cp5.getController("dishlabel3").show();
    state = 3;
    return;
  }
}

public void dish4() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  

  if (state == 2) {

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .data("meal choice", dishes[r4].name)
      .data("meal price", dishes[r4].price)
      .data("meal Spicyness", dishes[r4].spice)
      .data("meal difficulty", dishes[r4].difficulty)
      .data("meal kcal", dishes[r4].kcal)
      .data("meal cooking time", dishes[r4].time)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("meal choice", dishes[r4].name)
      .data("weekday (sun-sat)", weekday)
      .log();  
    setButtonStyle(submit, font, "Return");  
    //Switch interface after Submit
    interface4();
        cp5.getController("dishlabel4").show();
    state = 3;
    return;
  }
}

public void dish5() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  

  if (state == 2) {

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .data("meal choice", dishes[r5].name)
      .data("meal price", dishes[r5].price)
      .data("meal Spicyness", dishes[r5].spice)
      .data("meal difficulty", dishes[r5].difficulty)
      .data("meal kcal", dishes[r5].kcal)
      .data("meal cooking time", dishes[r5].time)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("meal choice", dishes[r5].name)
      .data("weekday (sun-sat)", weekday)
      .log();  
    setButtonStyle(submit, font, "Return");  
    //Switch interface after Submit
    interface4();
        cp5.getController("dishlabel5").show();
    state = 3;
    return;
  }
}
