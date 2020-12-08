// ********************************************************
// Author: Lars Giling 
// Co-Author: Mervyn Franssen
// Date: Nov. 30, 2020
// Description: Code  to  collect and parse cooking data of
//              users,  sending  interaction  data  to Data 
//              Foundry and providing personalized feedback
// ********************************************************

import java.util.Map;
import java.util.Calendar;
import controlP5.*;
import nl.tue.id.datafoundry.*;

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
String preftime = "";
String prefkcal = "";
String acttime = "";
String userage = "";
String userweight = "";
String prefcuisine = "";
String usereducationlvl = ""; 
String prefprice = "";
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
int Difficulty = 1;
int Spiciness = 1;
int Rating = 1;
int diffrating;
int spicyrating;
int housesize;
int rate;
float c_speed;

//create array of class (object) Dish (so it's easy to search through the dishes with a for-loop)
Dish[] dishes = new Dish[20];

// UI elements
ControlP5 cp5;
controlP5.Button submit;
controlP5.Textfield username;
controlP5.Textfield prefertime;
controlP5.Textfield actualtime;
controlP5.Textfield preferkcal;
controlP5.Textfield age;
controlP5.Textfield weight;
controlP5.Textlabel title;
controlP5.Textlabel timelabel;
controlP5.Textlabel timelabel2;
controlP5.Textlabel dishlabel1;
controlP5.Textlabel dishlabel2;
controlP5.Textlabel dishlabel3;
controlP5.Textlabel dishlabel4;
controlP5.Textlabel dishlabel5;
controlP5.ScrollableList cuisine;
controlP5.ScrollableList educationlvl;
controlP5.ScrollableList price;
controlP5.ScrollableList gender;
controlP5.ScrollableList dietgoal;
controlP5.ScrollableList dietpref;
controlP5.ScrollableList basis;
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
  dishes[0] = new Dish("Jamaican Jerk Chicken", "Chicken", "", "", "", "", "");
  dishes[1] = new Dish("Pasta Salad", "Kielbasa", "Noodles", "", "", "", "");
  dishes[2] = new Dish("Lasagna", "Sausage", "Noodles", "", "", "", "");
  dishes[3] = new Dish("Hearty Pancakes", "Milk", "Eggs", "Corn Meal", "", "", "");
  dishes[4] = new Dish("Spaghetti", "Noodles", "Marinara Sauce", "", "", "", "");
  dishes[5] = new Dish("White beans, tomatoes, and spinach", "Rice", "Vegetarian", "Beans", "Eggs", "", "");
  dishes[6] = new Dish("Cashew Chicken with Noodles", "Noodles", "Chicken", "", "", "", "");
  dishes[7] = new Dish("Asian Shredded Beef", "Beef", "Noodles", "", "", "", "");
  dishes[8] = new Dish("Shepherd's Pie", "Beef", "Potatoes", "", "", "", "");
  dishes[9] = new Dish("Thai Chicken", "Chicken", "Noodles", "Eggs", "", "", "");
  dishes[10] = new Dish("One Pot Chicken & Potatoes", "Potatoes", "Chicken", "Carrots", "Onion", "", "");
  dishes[11] = new Dish("Honey Lime Chicken", "Chicken", "Rice", "", "", "", "");
  dishes[12] = new Dish("Lentil Curry", "Lentils", "Carrots", "Onion", "", "", "");
  dishes[13] = new Dish("Potato Apple Roast", "Apple", "Potatoes", "Ham", "", "", "");
  dishes[14] = new Dish("Bucatini all'Amatriciana", "Noodles", "Tomatoes", "Bacon", "", "", "");
  dishes[15] = new Dish("Potato Currry", "Potatoes", "Vegetarian", "", "", "", "");
  dishes[16] = new Dish("Balsamic Dijon Root Vegetables", "Potatoes", "Onion", "Carrots", "Parsnips", "", "");
  dishes[17] = new Dish("Best Baked Chicken Legs", "Chicken", "Rice", "", "", "", "");
  dishes[18] = new Dish("Chickpea Broccoli Pesto", "Broccoli", "Chickpeas", "", "", "", "");
  dishes[19] = new Dish("Soy Mustard Salmon", "Salmon", "Soy Sauce", "Dijon Mustard", "Garlic", "Ginger", "");

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
  //if the user has not cooked yet (start interface)
  if (state == 0) {
    //collect values from the boxes (see helpers tab)
    setUname();

    //print results in console
    print("\nusername: " + uname, "\npreferred time: " + preftime, 
      "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base, 
      "\ndifficulty: " + diffrating);

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
      .data("weight", userweight)
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
      .data("weight", userweight)
      //Sliders
      .data("Householdsize", housesize)
      .log(); 
    
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
    fetchData();

    //print results in console
    print("\nusername: " + uname, "\npreferred time: " + preftime, 
      "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base, 
      "\ndifficulty: " + diffrating);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .data("preferred time", preftime)
      .data("preferred kcal", prefkcal)
      .data("cuisine", prefcuisine)
      .data("price", prefprice)
      .data("base ingredient", base)
      .data("difficulty", diffrating)
      .data("Spiciness", spicyrating)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .data("preferred kcal", prefkcal)
      .data("cuisine", prefcuisine)
      .data("price", prefprice)
      .data("dietgoal", userdietgoal)
      .data("gender", usergender)
      .data("weekday (sun-sat)", weekday)
      .data("difficulty", diffrating)
      .data("Spiciness", spicyrating)
      .log();
    
    CheckDish("Potatoes");  //test - this should actually read the selected ingredient of <basis> (cp5)
    
    //Switch interface after Submit
    interface3();
    state = 2;
    return;
  }
  /********************************************************************************************/
  //if the user has cooked (second interface) and submits
  if (state == 2) {
    //collect data from entries and data foundry
    setActual();
    fetchData();

    //print results of entries and calculations
    print("\nusername: " + uname, "\npreferred time: " + preftime, 
      "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base, 
      "\ndifficulty: " + diffrating);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("weekday (sun-sat)", weekday)
      .log();
      
    //Switch interface after Submit
    interface4();
    state = 3;
  }
  /********************************************************************************************/
    if (state == 3) {
    //collect data from entries and data foundry
    setActual();
    fetchData();

    //print results of entries and calculations
    print("\nusername: " + uname, "\npreferred time: " + preftime, "\nrating: " + rate, "\nactual time: " + acttime);

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
    interface1();
    state = 0;
  }
  /********************************************************************************************/
}
