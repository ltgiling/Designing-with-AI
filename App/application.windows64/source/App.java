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
// Authors: Lars Giling
// Date: Nov. 17, 2020
// Description: Code  to  collect and parse cooking data of
//              users,  sending  interaction  data  to Data 
//              Foundry and providing personalized feedback
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
String preftime = "";
String acttime = "";
String prefcuisine = "";
String t_pref = "";
String t_base = "";
String base = "";
boolean isStart;
int bgColor;
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
public void setup() {
  // initiate canvas in mobile resolution
  
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
public void draw() {
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

//get the user name and preferred time from the text field.
public void setUname() {
  uname = cp5.get(Textfield.class, "Username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();

  // if the text field is empty, random Id!
  if (uname.isEmpty()) {
    uname = "rand" + round(random(1000, 20000));
    username.setText(uname);
  }
  if (preftime.isEmpty()) {
    preftime = "0";
    prefertime.setText(preftime);
  }
}
//on the second screen, get the values that were submitted
public void setActual() {
  uname = cp5.get(Textfield.class, "Username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();
  acttime = cp5.get(Textfield.class, "actualtime").getText();
} 

//fetch data from data foundry and parse strings to integers where needed
//calculate the relative speed of the user over all of their inputs
public void fetchData() {
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
}
// ------------------------------------------------------------------------
// different methods to properly read the dropdown box values 
public void cuisine(int index) {
  prefcuisine = cp5.get(ScrollableList.class, "cuisine").getItem(index).get("name").toString();
}

public void basis(int index3) {
  base = cp5.get(ScrollableList.class, "basis").getItem(index3).get("name").toString();
}

public void Difficulty(int c_diff){
  diffrating = c_diff;
}
public void Rating(int c_rate){
  rate = c_rate;
}
//makes sure calculations aren't done with empty fields
public String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}
public void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  

  cp5.addSlider("Difficulty")
    .setPosition(185, 280)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Difficulty:")
    .setFont(font);
  cp5.getController("Difficulty").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp5.addSlider("Rating")
    .setPosition(235, 385)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Rating:")
    .setFont(font)
    .hide();
  cp5.getController("Rating").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  username = cp5.addTextfield("Username")
    .setPosition(37, 75)
    .setSize(300, 30)
    .setFont(font)
    .setId(1);
  cp5.getController("Username").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);


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

  title = cp5.addTextlabel("title")
    .setPosition(25, 10)
    .setFont(createFont("Calibri", 30))
    .setValue("Personal meal suggestions")
    .setId(7); 

  timelabel = cp5.addTextlabel("timelabel")
    .setPosition(25, 45)
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

  // set components style to display: textfields, buttons
  //setTextfieldStyle(username, font, "User name");
  setTextfieldStyle(prefertime, font, "Preferred \ncooking time");
  setTextfieldStyle(actualtime, font, "Actual cooking time");
  setButtonStyle(submit, font, "Submit");
}
public void interface1() {
  //show and hide components for second interface
  cp5.getController("actualtime").show();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").show();
  cp5.getController("Username").hide();
  cp5.getController("prefertime").hide();
  cp5.getController("cuisine").hide();
  cp5.getController("basis").hide();
  cp5.getController("Difficulty").hide();
}
public void interface2() {
  //show and hide components for first interface
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").show();
  cp5.getController("prefertime").show();
  cp5.getController("cuisine").show();
  cp5.getController("basis").show();
  cp5.getController("Difficulty").show();
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
