import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Map; 
import java.util.Calendar; 
import controlP5.*; 
import nl.tue.id.datafoundry.*; 

import nl.tue.id.datafoundry.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class App extends PApplet {

// ********************************************************
// Author: Lars Giling 
// Co-Authors: Mervyn Franssen, Jeroen Krukkert
// Date: Dec. 13, 2020
// Description: Code  to  collect and parse cooking data of
//              users,  sending  interaction  data  to Data 
//              Foundry for providing personalized feedback
// ********************************************************






// ------------------------------------------------------------------------
// settings for DataFoundry library
String host = "data.id.tue.nl";
String iot_api_token = "lm4yJj+L6hGNi5QAcvjKEqxv6KMV0uYidtbtocBtfYx6W4VkMcSBaxMvfvWoXFap";
String entity_api_token = "KPVgGbT9MHTZuPSKf3ApVRGKh6MaRtrPNwGA5d2jeIJcfhfQO2muAzVpxsKuWlz/";
long iot_id = 733;
long entity_id = 734;
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
int bgColor;
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
//controlP5.ScrollableList price;
//Slider
Slider abc;

// ------------------------------------------------------------------------
public void setup() {
  // initiate canvas in mobile resolution
  
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
  dishes[8] = new Dish("Shepherd's Pie", "$$$", "5", "1", "930", "100", "Beef", "Potatoes", "", "", "", "");
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
public void draw() {
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
    state = 3;
    return;
  }
}
//get the user name and preferred time from the text field.
public void setUname() {
  uname = cp5.get(Textfield.class, "Username").getText();
  //preftime = cp5.get(Textfield.class, "prefertime").getText();
  //prefkcal = cp5.get(Textfield.class, "preferkcal").getText();

  // if the text field is empty, random Id!
  if (uname.isEmpty()) {
    uname = "rand" + round(random(1000, 20000));
    username.setText(uname);
  }
  //if (preftime.isEmpty()) {
  //  preftime = "0";
  //  prefertime.setText(preftime);
  //} 
  //if (prefkcal.isEmpty()) {
  //  prefkcal = "0";
  //  preferkcal.setText(prefkcal);
  //}
}
//on the second screen, get the values that were submitted
public void setActual() {
  uname = cp5.get(Textfield.class, "Username").getText();
  //preftime = cp5.get(Textfield.class, "prefertime").getText();
  //prefkcal = cp5.get(Textfield.class, "preferkcal").getText();
  acttime = cp5.get(Textfield.class, "actualtime").getText();

  if (acttime.isEmpty()) {
    acttime = "0";
    actualtime.setText(acttime);
  }
} 

//fetch data from data foundry and parse strings to integers where needed
//calculate the relative speed of the user over all of their inputs
/* void fetchData() {
 entityDS.id(uname).token(uname);
 Map Data = entityDS.get();
 int t_entries = Integer.parseInt(checkProfileItem(Data.get("plays"), "0"));
 float db_speed = Float.parseFloat(checkProfileItem(Data.get("relative speed"), "0"));
 c_clicks = t_entries;
 c_clicks++;
 float ptime = Float.parseFloat(preftime);
 float atime = Float.parseFloat(acttime);
 float local_speed = ptime / atime;
 c_speed = (((t_entries * db_speed) + local_speed) / (t_entries + 1));
 print("\nlocal speed: " + local_speed + ", relative speed: " + c_speed);
 } */
// ------------------------------------------------------------------------
// different methods to properly read the dropdown box values 
public void cuisine(int index) {
  prefcuisine = cp5.get(ScrollableList.class, "cuisine").getItem(index).get("name").toString();
}
public void educationlvl(int index) {
  usereducationlvl = cp5.get(ScrollableList.class, "educationlvl").getItem(index).get("name").toString();
}
//void price(int index) {
//  prefprice = cp5.get(ScrollableList.class, "price").getItem(index).get("name").toString();
//}
public void gender(int index) {
  usergender = cp5.get(ScrollableList.class, "gender").getItem(index).get("name").toString();
}
public void age(int index) {
  userage = cp5.get(ScrollableList.class, "age").getItem(index).get("name").toString();
}
public void weight(int index) {
  userweight = cp5.get(ScrollableList.class, "weight").getItem(index).get("name").toString();
}
public void dietgoal(int index) {
  userdietgoal = cp5.get(ScrollableList.class, "dietgoal").getItem(index).get("name").toString();
}
public void dietpref(int index) {
  userdietpref = cp5.get(ScrollableList.class, "dietpref").getItem(index).get("name").toString();
}
public void basis(int index3) {
  base = cp5.get(ScrollableList.class, "basis").getItem(index3).get("name").toString();
}
//void Difficulty(int c_diff) {
//  diffrating = c_diff;
//}
public void Rating(int c_rate) {
  rate = c_rate;
}
//void Spiciness(int c_spice) {
//  spicyrating = c_spice;
//}
public void Householdsize(int c_hsize) {
  housesize = c_hsize;
}

//makes sure calculations aren't done with empty fields
public String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}
public void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);
  ControlFont dishFont = new ControlFont(pfont, 12); 

  /*  cp5.addSlider("Difficulty")
   .setPosition(185, 325)
   .setSize(100, 20)
   .setRange(1, 5)
   .setNumberOfTickMarks(5)
   .setLabel("Difficulty:")
   .setFont(font);
   cp5.getController("Difficulty").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
   
   cp5.addSlider("Spiciness")
   .setPosition(185, 380)
   .setSize(100, 20)
   .setRange(1, 5)
   .setNumberOfTickMarks(5)
   .setLabel("Preferred spiciness:")
   .setFont(font);
   cp5.getController("Spiciness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
   */
  cp5.addSlider("Householdsize")
    .setPosition(185, 355)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Size household:")
    .setFont(font);
  cp5.getController("Householdsize").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp5.addSlider("Rating")
    .setPosition(235, 385)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Meal rating:")
    .setFont(font);
  cp5.getController("Rating").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  username = cp5.addTextfield("Username")
    .setPosition(37, 75)
    .setSize(300, 30)
    .setFont(font)
    .setId(1);
  // cp5.getController("Username").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  /*
  prefertime = cp5.addTextfield("prefertime")
   .setPosition(37, 175)
   .setSize(40, 30)
   .setFont(font)
   .setId(2);
   
   preferkcal = cp5.addTextfield("preferkcal")
   .setPosition(37, 255)
   .setSize(40, 30)
   .setFont(font)
   .setId(8);
   */
  weight = cp5.addScrollableList("weight")
    .setPosition(37, 255)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(130, 150)
    .addItem("55-65", 1)
    .addItem("66-75", 2)
    .addItem("76-85", 3)
    .addItem("86-95", 4)
    .addItem("96-105", 5)
    .addItem("106-115", 6)
    .addItem("116+", 7)
    .setValue(0)
    .setLabel("weight (kg)");
  this.weight.setItemHeight(25);
  weight.getCaptionLabel().getStyle().marginTop = 5;
  weight.getValueLabel().getStyle().marginTop = 5;

  age = cp5.addScrollableList("age")
    .setPosition(37, 155)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(130, 150)
    .addItem("18-25", 1)
    .addItem("26-35", 2)
    .addItem("36-45", 3)
    .addItem("46-55", 4)
    .addItem("56-65", 5)
    .addItem("66-75", 6)
    .addItem("76+", 7)
    .setValue(0)
    .setLabel("age");
  this.age.setItemHeight(25);
  age.getCaptionLabel().getStyle().marginTop = 5;
  age.getValueLabel().getStyle().marginTop = 5;

  submit = cp5.addButton("submit")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(3);

  actualtime = cp5.addTextfield("actualtime")
    .setPosition(37, 375)
    .setSize(40, 30)
    .setFont(font)
    .setId(4);   

  title = cp5.addTextlabel("title")
    .setPosition(25, 10)
    .setFont(createFont("Calibri", 30))
    .setValue("Personal meal suggestions")
    .setId(7); 

  timelabel = cp5.addTextlabel("timelabel")
    .setPosition(25, 45)
    .setFont(font)
    .setValue("Suggested meals:")
    .setId(5);

  timelabel2 = cp5.addTextlabel("timelabel2")
    .setPosition(182, 145)
    .setFont(font)
    .setValue("Meal Preferences:")
    .setId(6);

  /********************dish buttons*****************************/
  dish1 = cp5.addButton("dish1")
    .setPosition(37, 380)
    .setSize(100, 46)
    .setId(16);

  dish2 = cp5.addButton("dish2")
    .setPosition(137, 380)
    .setSize(100, 46)
    .setId(16);

  dish3 = cp5.addButton("dish3")
    .setPosition(237, 380)
    .setSize(100, 46)
    .setId(16);

  dish4 = cp5.addButton("dish4")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(16);

  dish5 = cp5.addButton("dish5")
    .setPosition(137, 430)
    .setSize(100, 46)
    .setId(16);

  /******************* dish labels *****************************/
  dishlabel1 = cp5.addTextlabel("dishlabel1")
    .setPosition(25, 75)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(11);
  dishlabel2 = cp5.addTextlabel("dishlabel2")
    .setPosition(25, 115)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(12);
  dishlabel3 = cp5.addTextlabel("dishlabel3")
    .setPosition(25, 155)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(13);
  dishlabel4 = cp5.addTextlabel("dishlabel4")
    .setPosition(25, 195)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(14);
  dishlabel5 = cp5.addTextlabel("dishlabel5")
    .setPosition(25, 235)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(15);
  /********************* attribute labels **********************/
  priceLabel1 = cp5.addTextlabel("priceLabel1")
    .setPosition(45, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel1 = cp5.addTextlabel("difficultyLabel1")
    .setPosition(110, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel1 = cp5.addTextlabel("spicynessLabel1")
    .setPosition(180, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel1 = cp5.addTextlabel("kcalLabel1")
    .setPosition(235, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel1 = cp5.addTextlabel("timetocookLabel1")
    .setPosition(295, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel2 = cp5.addTextlabel("priceLabel2")
    .setPosition(45, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel2 = cp5.addTextlabel("difficultyLabel2")
    .setPosition(110, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel2 = cp5.addTextlabel("spicynessLabel2")
    .setPosition(180, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel2 = cp5.addTextlabel("kcalLabel2")
    .setPosition(235, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel2 = cp5.addTextlabel("timetocookLabel2")
    .setPosition(295, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel3 = cp5.addTextlabel("priceLabel3")
    .setPosition(45, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel3 = cp5.addTextlabel("difficultyLabel3")
    .setPosition(110, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel3 = cp5.addTextlabel("spicynessLabel3")
    .setPosition(180, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel3 = cp5.addTextlabel("kcalLabel3")
    .setPosition(235, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel3 = cp5.addTextlabel("timetocookLabel3")
    .setPosition(295, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel4 = cp5.addTextlabel("priceLabel4")
    .setPosition(45, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel4 = cp5.addTextlabel("difficultyLabel4")
    .setPosition(110, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel4 = cp5.addTextlabel("spicynessLabel4")
    .setPosition(180, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel4 = cp5.addTextlabel("kcalLabel4")
    .setPosition(235, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel4 = cp5.addTextlabel("timetocookLabel4")
    .setPosition(295, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel5 = cp5.addTextlabel("priceLabel5")
    .setPosition(45, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel5 = cp5.addTextlabel("difficultyLabel5")
    .setPosition(110, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel5 = cp5.addTextlabel("spicynessLabel5")
    .setPosition(180, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel5 = cp5.addTextlabel("kcalLabel5")
    .setPosition(235, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel5 = cp5.addTextlabel("timetocookLabel5")
    .setPosition(295, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  /*
  price = cp5.addScrollableList("price")
   .setPosition(185, 255)
   .setFont(font)
   .setItemHeight(10)
   .setBarHeight(30)
   .setSize(150, 150)
   .addItem("No preference", 1)
   .addItem("$", 2)
   .addItem("$$", 3)
   .addItem("$$$", 4)
   .setValue(0)
   .setLabel("price range");
   this.price.setItemHeight(25);
   price.getCaptionLabel().getStyle().marginTop = 5;
   price.getValueLabel().getStyle().marginTop = 5;
   */
  basis = cp5.addScrollableList("basis")
    .setPosition(185, 215)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Rice", 2)
    .addItem("Potatoes", 3)
    .addItem("Chicken", 4)
    .addItem("Noodles", 5)
    .addItem("Lettuce", 6)
    .setValue(0)
    .setLabel("Ingredient preference"); 
  this.basis.setItemHeight(25);
  basis.getCaptionLabel().getStyle().marginTop = 5;
  basis.getValueLabel().getStyle().marginTop = 5; 

  cuisine = cp5.addScrollableList("cuisine")
    .setPosition(185, 175)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Asian", 2)
    .addItem("Dutch", 3)
    .addItem("Indian", 4)
    .addItem("Italian", 5)
    .setValue(0)
    .setLabel("cuisine");
  this.cuisine.setItemHeight(25);
  cuisine.getCaptionLabel().getStyle().marginTop = 5;
  cuisine.getValueLabel().getStyle().marginTop = 5;

  educationlvl = cp5.addScrollableList("educationlvl")
    .setPosition(185, 285)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("None", 1)
    .addItem("Primary School", 2)
    .addItem("High School", 3)
    .addItem("MBO", 4)
    .addItem("HBO", 5)
    .addItem("WO", 6)
    .setValue(0)
    .setLabel("education level"); 
  this.educationlvl.setItemHeight(25);
  educationlvl.getCaptionLabel().getStyle().marginTop = 5;
  educationlvl.getValueLabel().getStyle().marginTop = 5; 

  dietpref = cp5.addScrollableList("dietpref")
    .setPosition(185, 235)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Vegan", 2)
    .addItem("Vegetarian", 3)
    .addItem("Meat", 4)
    .setValue(0)
    .setLabel("diet preference");
  this.dietpref.setItemHeight(25);
  dietpref.getCaptionLabel().getStyle().marginTop = 5;
  dietpref.getValueLabel().getStyle().marginTop = 5; 

  dietgoal = cp5.addScrollableList("dietgoal")
    .setPosition(185, 185)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Maintain Weight", 2)
    .addItem("Gain Weight", 3)
    .addItem("Lose Weight", 4)
    .setValue(0)
    .setLabel("diet goal");
  this.dietgoal.setItemHeight(25);
  dietgoal.getCaptionLabel().getStyle().marginTop = 5;
  dietgoal.getValueLabel().getStyle().marginTop = 5;  

  gender = cp5.addScrollableList("gender")
    .setPosition(185, 135)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Female", 2)
    .addItem("Male", 3)
    .setValue(0)
    .setLabel("gender");
  this.gender.setItemHeight(25);
  gender.getCaptionLabel().getStyle().marginTop = 5;
  gender.getValueLabel().getStyle().marginTop = 5;

  // set components style to display: textfields, buttons
  // setTextfieldStyle(username, font, "User name");
  //setTextfieldStyle(prefertime, font, "Preferred \ncooking time");
  //setTextfieldStyle(preferkcal, font, "Preferred \nkcal in meal");
  setTextfieldStyle(actualtime, font, "Actual time \nspent cooking");
  setButtonStyle(submit, font, "Continue");
  setButtonStyle(dish1, font, "Dish 1");
  setButtonStyle(dish2, font, "Dish 2");
  setButtonStyle(dish3, font, "Dish 3");
  setButtonStyle(dish4, font, "Dish 4");
  setButtonStyle(dish5, font, "Dish 5");
}
public void interface1() {
  //show and hide components for first interface
  //first interface for user data
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").show();
  cp5.getController("age").show();
  cp5.getController("gender").show();
  cp5.getController("dietgoal").show();
  cp5.getController("dietpref").show();
  cp5.getController("weight").show();
  cp5.getController("Householdsize").show();
  cp5.getController("educationlvl").show();
  //cp5.getController("prefertime").hide();
  //cp5.getController("preferkcal").hide();
  //cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  //cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  //cp5.getController("Difficulty").hide();
  //Hide dish buttons
  cp5.getController("dish1").hide();
  cp5.getController("dish2").hide();
  cp5.getController("dish3").hide();
  cp5.getController("dish4").hide();
  cp5.getController("dish5").hide();
  cp5.getController("submit").show();
  //dishlabels
  cp5.getController("dishlabel1").hide();
  cp5.getController("dishlabel2").hide();
  cp5.getController("dishlabel3").hide();
  cp5.getController("dishlabel4").hide();
  cp5.getController("dishlabel5").hide();
  //attribute labels
  cp5.getController("priceLabel1").hide();
  cp5.getController("difficultyLabel1").hide();
  cp5.getController("spicynessLabel1").hide();
  cp5.getController("kcalLabel1").hide();
  cp5.getController("timetocookLabel1").hide();
  cp5.getController("priceLabel2").hide();
  cp5.getController("difficultyLabel2").hide();
  cp5.getController("spicynessLabel2").hide();
  cp5.getController("kcalLabel2").hide();
  cp5.getController("timetocookLabel2").hide();
  cp5.getController("priceLabel3").hide();
  cp5.getController("difficultyLabel3").hide();
  cp5.getController("spicynessLabel3").hide();
  cp5.getController("kcalLabel3").hide();
  cp5.getController("timetocookLabel3").hide();
  cp5.getController("priceLabel4").hide();
  cp5.getController("difficultyLabel4").hide();
  cp5.getController("spicynessLabel4").hide();
  cp5.getController("kcalLabel4").hide();
  cp5.getController("timetocookLabel4").hide();
  cp5.getController("priceLabel5").hide();
  cp5.getController("difficultyLabel5").hide();
  cp5.getController("spicynessLabel5").hide();
  cp5.getController("kcalLabel5").hide();
  cp5.getController("timetocookLabel5").hide();
}
public void interface2() {
  //show and hide components for second interface
  //second interface for meal data
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  //cp5.getController("Spiciness").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("gender").hide();
  cp5.getController("dietgoal").hide();
  cp5.getController("dietpref").hide();
  cp5.getController("weight").hide();
  cp5.getController("Householdsize").hide();
  cp5.getController("educationlvl").hide();
  //cp5.getController("preferkcal").show();
  //cp5.getController("price").show();
  cp5.getController("cuisine").show();
  //cp5.getController("prefertime").show();
  cp5.getController("basis").show();
  //cp5.getController("Difficulty").show();
  //Hide dish buttons
  cp5.getController("dish1").hide();
  cp5.getController("dish2").hide();
  cp5.getController("dish3").hide();
  cp5.getController("dish4").hide();
  cp5.getController("dish5").hide();
  cp5.getController("submit").show();
  //dishlabels
  cp5.getController("dishlabel1").hide();
  cp5.getController("dishlabel2").hide();
  cp5.getController("dishlabel3").hide();
  cp5.getController("dishlabel4").hide();
  cp5.getController("dishlabel5").hide();
}
public void interface3() {
  //show and hide components for third interface
  //third interface for meal suggestion
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").hide();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("gender").hide();
  cp5.getController("dietgoal").hide();
  cp5.getController("dietpref").hide();
  cp5.getController("weight").hide();
  cp5.getController("Householdsize").hide();
  cp5.getController("educationlvl").hide();
  //cp5.getController("prefertime").hide();
  //cp5.getController("preferkcal").hide();
  //cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  //cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  //cp5.getController("Difficulty").hide();
  //Show dish buttons
  cp5.getController("dish1").show();
  cp5.getController("dish2").show();
  cp5.getController("dish3").show();
  cp5.getController("dish4").show();
  cp5.getController("dish5").show();
  cp5.getController("submit").hide();
  //dishlabels
  cp5.getController("dishlabel1").show();
  cp5.getController("dishlabel2").show();
  cp5.getController("dishlabel3").show();
  cp5.getController("dishlabel4").show();
  cp5.getController("dishlabel5").show();
  //attribute labels
  cp5.getController("priceLabel1").show();
  cp5.getController("difficultyLabel1").show();
  cp5.getController("spicynessLabel1").show();
  cp5.getController("kcalLabel1").show();
  cp5.getController("timetocookLabel1").show();
  cp5.getController("priceLabel2").show();
  cp5.getController("difficultyLabel2").show();
  cp5.getController("spicynessLabel2").show();
  cp5.getController("kcalLabel2").show();
  cp5.getController("timetocookLabel2").show();
  cp5.getController("priceLabel3").show();
  cp5.getController("difficultyLabel3").show();
  cp5.getController("spicynessLabel3").show();
  cp5.getController("kcalLabel3").show();
  cp5.getController("timetocookLabel3").show();
  cp5.getController("priceLabel4").show();
  cp5.getController("difficultyLabel4").show();
  cp5.getController("spicynessLabel4").show();
  cp5.getController("kcalLabel4").show();
  cp5.getController("timetocookLabel4").show();
  cp5.getController("priceLabel5").show();
  cp5.getController("difficultyLabel5").show();
  cp5.getController("spicynessLabel5").show();
  cp5.getController("kcalLabel5").show();
  cp5.getController("timetocookLabel5").show();
}
public void interface4() {
  //show and hide components for fourth interface
  //fourth interface for meal (suggestion) rating
  cp5.getController("actualtime").show();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").show();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("gender").hide();
  cp5.getController("dietgoal").hide();
  cp5.getController("dietpref").hide();
  cp5.getController("weight").hide();
  cp5.getController("Householdsize").hide();
  cp5.getController("educationlvl").hide();
  //cp5.getController("prefertime").hide();
  //cp5.getController("preferkcal").hide();
  //cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  //cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  //cp5.getController("Difficulty").hide();
  //Hide dish buttons
  cp5.getController("dish1").hide();
  cp5.getController("dish2").hide();
  cp5.getController("dish3").hide();
  cp5.getController("dish4").hide();
  cp5.getController("dish5").hide();
  cp5.getController("submit").show();
  //dishlabels
  cp5.getController("dishlabel1").hide();
  cp5.getController("dishlabel2").hide();
  cp5.getController("dishlabel3").hide();
  cp5.getController("dishlabel4").hide();
  cp5.getController("dishlabel5").hide();
  //attribute labels
  cp5.getController("priceLabel1").hide();
  cp5.getController("difficultyLabel1").hide();
  cp5.getController("spicynessLabel1").hide();
  cp5.getController("kcalLabel1").hide();
  cp5.getController("timetocookLabel1").hide();
  cp5.getController("priceLabel2").hide();
  cp5.getController("difficultyLabel2").hide();
  cp5.getController("spicynessLabel2").hide();
  cp5.getController("kcalLabel2").hide();
  cp5.getController("timetocookLabel2").hide();
  cp5.getController("priceLabel3").hide();
  cp5.getController("difficultyLabel3").hide();
  cp5.getController("spicynessLabel3").hide();
  cp5.getController("kcalLabel3").hide();
  cp5.getController("timetocookLabel3").hide();
  cp5.getController("priceLabel4").hide();
  cp5.getController("difficultyLabel4").hide();
  cp5.getController("spicynessLabel4").hide();
  cp5.getController("kcalLabel4").hide();
  cp5.getController("timetocookLabel4").hide();
  cp5.getController("priceLabel5").hide();
  cp5.getController("difficultyLabel5").hide();
  cp5.getController("spicynessLabel5").hide();
  cp5.getController("kcalLabel5").hide();
  cp5.getController("timetocookLabel5").hide();
}
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
public void CheckDish(String ingr) {

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
public void PickRandomDish() {
  r1 = PApplet.parseInt(random(50));
  r2 = PApplet.parseInt(random(50));
  r3 = PApplet.parseInt(random(50));
  r4 = PApplet.parseInt(random(50));
  r5 = PApplet.parseInt(random(50));

  //this loop makes sure that multiple dishlabels don't display the same dish
  while ((r2 == r1 || r2 == r3 || r2 == r4 || r2 == r5) || (r3 == r1 || r3 == r4 || r3 == r5) || (r4 == r1 || r4 == r5) || (r5 == r1)) {
    r2 = PApplet.parseInt(random(50));
    r3 = PApplet.parseInt(random(50));
    r4 = PApplet.parseInt(random(50));
    r5 = PApplet.parseInt(random(50));
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

// styling of UI ---------------------------------------------------------------------------

public void setTextfieldStyle(controlP5.Textfield tf, ControlFont cf, String txt) {
  tf.getCaptionLabel()
    .setFont(cf)
    .toUpperCase(false)
    .setText(txt);
  tf.getCaptionLabel().getStyle().marginTop = -75;
}

public void setButtonStyle(controlP5.Button btn, ControlFont cf, String label) {
  btn.getCaptionLabel()
    .setFont(cf)
    .setSize(24)
    .toUpperCase(false)
    .setText(label);
}
  public void settings() {  size(375, 502); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "App" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
