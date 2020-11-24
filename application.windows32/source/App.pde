// ******************************************************
// Author: I-Tang(Eden) Chiang 
// Date: Oct. 30, 2020
// Description: Sample code for AAI lecture of Industrial
//              Design Department, TU/e to demostrate
//              sending interaction data to Data Foundry
//              by Processing app via OOCSI service
// ******************************************************

import java.util.Map;
import controlP5.*;
import nl.tue.id.datafoundry.*;

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
color bgColor;
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

void draw() {
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
