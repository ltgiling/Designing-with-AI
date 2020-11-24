import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Map; 
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

// ******************************************************
// Author: I-Tang(Eden) Chiang 
// Date: Oct. 30, 2020
// Description: Sample code for AAI lecture of Industrial
//              Design Department, TU/e to demostrate
//              sending interaction data to Data Foundry
//              by Processing app via OOCSI service
// ******************************************************





// ------------------------------------------------------------------------
// settings for DataFoundry library
//
// ... :: CHANGE API TOKENS AND IDS YOURSELF! :: ...
//
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

// variables
String uname = "";
String preftime = "";
String acttime = "";
boolean isStart;
int bgColor;
int state;
int c_clicks;
float c_speed;

// UI elements
ControlP5 cp5;
controlP5.Button submit;
controlP5.Textfield username;
controlP5.Textfield prefertime;
controlP5.Textfield actualtime;
controlP5.Textlabel timelabel;

public void setup() {
  // initiate canvas in mobile resolution
  
  background(0);
  frameRate(20);
  noStroke();

  bgColor = 0;
  state = 0;  
  isStart = false;

  // set text style
  PFont pfont = createFont("Arial", 24);
  ControlFont font = new ControlFont(pfont, 24);

  // init ControlerP5
  cp5 = new ControlP5(this);

  // init components

  username = cp5.addTextfield("username")
    .setPosition(37, 75)
    .setSize(300, 40)
    .setFont(font)
    .setId(1);

  prefertime = cp5.addTextfield("prefertime")
    .setPosition(37, 175)
    .setSize(100, 40)
    .setFont(font)
    .setId(2);

  submit = cp5.addButton("submit")
    .setPosition(37, 250)
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

  // set components style to display: textfields, buttons
  setTextfieldStyle(username, font, "User name");
  setTextfieldStyle(prefertime, font, "Preferred cooking time");
  setTextfieldStyle(actualtime, font, "Actual cooking time");
  setButtonStyle(submit, font, "Submit");
}

public void draw() {
  background(bgColor);
}

// button handler -------------------------------------------------------------------

public void submit() {
  if (state == 0) {
    setUname();

    entityDS.id(uname).token(uname);
    entityDS.data("preferred time", preftime).update();
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .log();

    cp5.getController("actualtime").show();
    cp5.getController("timelabel").show();
    cp5.getController("submit").setPosition(37, 425);
    cp5.getController("username").hide();
    cp5.getController("prefertime").hide();
    state = 1;
    return;
  }
  if (state == 1) {
    setActual();
    fetchData();

    entityDS.id(uname).token(uname);
    entityDS.data("actual time", acttime).data("plays", c_clicks).data("relative speed", c_speed).update();
    iotDS.device(uname).activity("time")
      .data("preferred time", preftime)
      .data("actual time", acttime)
      .log();

    // System.out.print("\nTotal plays: " + totalentries + ", relative speed: " + db_speed);
  }
}

// if username is empty, get the user name from the text field -- ONCE.
public void setUname() {
  uname = cp5.get(Textfield.class, "username").getText();
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
  print("\nusername: " + uname, "\npreferred time: " + preftime);
}

public void setActual() {
  uname = cp5.get(Textfield.class, "username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();
  acttime = cp5.get(Textfield.class, "actualtime").getText();

  print("\nusername: " + uname, "\npreferred time: " + preftime, "actual time: " + acttime);
} 

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

public String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}

// styling ---------------------------------------------------------------------------

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
