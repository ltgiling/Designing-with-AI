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
String base = "";
boolean isStart;
color bgColor;
int state;
int c_clicks;
int weekday;
int Difficulty = 1;
int Rating = 1;
int diffrating;
int rate;
float c_speed;

// UI elements
ControlP5 cp5;
controlP5.Button submit;
controlP5.Textfield username;
controlP5.Textfield prefertime;
controlP5.Textfield actualtime;
controlP5.Textlabel title;
controlP5.Textlabel timelabel;
controlP5.Textlabel timelabel2;
controlP5.ScrollableList cuisine;
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

  // initiate ControlerP5
  Label.setUpperCaseDefault(false);
  cp5 = new ControlP5(this);
  // all of the components (buttons, fields, dropdown menu's)
  cp5components();

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
    entityDS.data("preferred time", preftime)
      .data("cuisine", prefcuisine)
      .data("base ingredient", base)
      .data("difficulty", diffrating)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .data("cuisine", prefcuisine)
      .data("weekday (sun-sat)", weekday)
      .data("difficulty", diffrating)
      .log();

    interface1();
    state = 1;
    return;
  }
  //if the user has cooked (second interface) and submits
  if (state == 1) {
    //collect data from entries and data foundry
    setActual();
    fetchData();

    //print results of entries and calculations
    print("\nusername: " + uname, "\npreferred time: " + preftime, 
      "actual time: " + acttime, "\nrating: " + rate);

    //send data to data foundry entity database
    entityDS.id(uname).token(uname);
    entityDS.data("actual time", acttime)
      .data("plays", c_clicks)
      .data("relative speed", c_speed)
      .data("rating", rate)
      .update();
    //send data to data foundry iot database
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .data("actual time", acttime)
      .data("cuisine", prefcuisine)
      .data("rating", rate)
      .data("weekday (sun-sat)", weekday)
      .log();

    interface2();
    state = 0;
  }
}
