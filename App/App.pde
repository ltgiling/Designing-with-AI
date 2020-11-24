// ********************************************************
// Authors: Lars Giling
// Date: Nov. 17, 2020
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
String acttime = "";
String prefcuisine = "";
String t_pref = "";
String t_base = "";
String rate = "";
String base = "";
boolean isStart;
color bgColor;
int state;
int c_clicks;
int weekday;
float c_speed;

// UI elements
ControlP5 cp5;
controlP5.Button submit;
controlP5.Textfield username;
controlP5.Textfield prefertime;
controlP5.Textfield actualtime;
controlP5.Textlabel timelabel;
controlP5.Textlabel timelabel2;
controlP5.ScrollableList cuisine;
controlP5.ScrollableList rating;
controlP5.ScrollableList basis;

// ------------------------------------------------------------------------
void setup() {
  // initiate canvas in mobile resolution
  size(375, 502);
  background(0);
  frameRate(20);
  noStroke();

  bgColor = 0;
  state = 0;  
  isStart = false;

  // set text style
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);

  // initiate ControlerP5
  Label.setUpperCaseDefault(false);
  cp5 = new ControlP5(this);

  // all of the components (buttons, fields, dropdown menu's)

  username = cp5.addTextfield("username")
    .setPosition(37, 75)
    .setSize(300, 30)
    .setFont(font)
    .setId(1);

  prefertime = cp5.addTextfield("prefertime")
    .setPosition(37, 175)
    .setSize(40, 30)
    .setFont(font)
    .setId(2);

  submit = cp5.addButton("submit")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(3);

  actualtime = cp5.addTextfield("actualtime")
    .setPosition(37, 375)
    .setSize(100, 40)
    .setFont(font)
    .setId(4)
    .hide();    

  timelabel = cp5.addTextlabel("timelabel")
    .setPosition(35, 25)
    .setFont(font)
    .setValue("Suggested meals:")
    .setId(5)
    .hide();

  timelabel2 = cp5.addTextlabel("timelabel2")
    .setPosition(182, 145)
    .setFont(font)
    .setValue("Meal Preferences:")
    .setId(6);

  basis = cp5.addScrollableList("basis")
    .setPosition(185, 215)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Rice", 2)
    .addItem("Potato", 3)
    .addItem("Bread", 4)
    .addItem("Lettuce", 5)
    .setValue(0)
    .setLabel("base ingredient"); 
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

  rating = cp5.addScrollableList("rating")
    .setPosition(185, 385)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(70, 120)
    .addItem("1", 1)
    .addItem("2", 2)
    .addItem("3", 3)
    .addItem("4", 4)
    .addItem("5", 5)
    .setValue(2)
    .setLabel("rating")
    .hide();
  this.rating.setItemHeight(25);
  rating.getCaptionLabel().getStyle().marginTop = 5;
  rating.getValueLabel().getStyle().marginTop = 5;


  // set components style to display: textfields, buttons
  setTextfieldStyle(username, font, "User name");
  setTextfieldStyle(prefertime, font, "Preferred \ncooking time");
  setTextfieldStyle(actualtime, font, "Actual cooking time");
  setButtonStyle(submit, font, "Submit");

  weekday = cal.get(Calendar.DAY_OF_WEEK);
}

// ------------------------------------------------------------------------
//very basic draw method of just the background
void draw() {
  background(bgColor);
}

// ------------------------------------------------------------------------
// different methods to properly read the dropdown box values 
void cuisine(int index) {
  prefcuisine = cp5.get(ScrollableList.class, "cuisine").getItem(index).get("name").toString();
}

void basis(int index3) {
  base = cp5.get(ScrollableList.class, "basis").getItem(index3).get("name").toString();
}

void rating(int index2) {
  rate = cp5.get(ScrollableList.class, "rating").getItem(index2).get("name").toString();
}

// ------------------------------------------------------------------------
//On submit button press
public void submit() {
  //if the user has not cooked yet (start interface)
  if (state == 0) {
    //collect values from the boxes (see helpers tab)
    setUname();
    //print results in console
    print("\nusername: " + uname, "\npreferred time: " + preftime, "\npreferred cuisine: " + prefcuisine, "\nbase ingredient: " + base);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS.data("preferred time", preftime).data("cuisine", prefcuisine).data("base ingredient", base).update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .data("cuisine", prefcuisine)
      .data("weekday (sun-sat)", weekday)
      .log();

    //show and hide components for second interface
    cp5.getController("actualtime").show();
    cp5.getController("timelabel").show();
    cp5.getController("timelabel2").hide();
    cp5.getController("rating").show();
    cp5.getController("username").hide();
    cp5.getController("prefertime").hide();
    cp5.getController("cuisine").hide();
    state = 1;
    return;
  }
  //if the user has cooked (second interface) and submits
  if (state == 1) {
    //collect data from entries and data foundry
    setActual();
    fetchData();

    //print results of entries and calculations
    print("\nusername: " + uname, "\npreferred time: " + preftime, "actual time: " + acttime, "\nrating: " + rate);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS.data("actual time", acttime).data("plays", c_clicks).data("relative speed", c_speed).data("rating", rate).update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .data("actual time", acttime)
      .data("cuisine", prefcuisine)
      .data("rating", rate)
      .data("weekday (sun-sat)", weekday)
      .log();
    state = 0;

    //show and hide components for first interface
    cp5.getController("actualtime").hide();
    cp5.getController("timelabel").hide();
    cp5.getController("timelabel2").show();
    cp5.getController("rating").hide();
    cp5.getController("username").show();
    cp5.getController("prefertime").show();
    cp5.getController("cuisine").show();
  }
}
