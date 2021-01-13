// *****************************************************
// Author: Lars Giling 
// Co-Authors: Mervyn Franssen, Jeroen Krukkert
// Date: January 11, 2021
// Description: Code to apply J48 ML model to user input
//              and data from online database about said
//              user in order to predict preferred meal.
// *****************************************************

import java.util.*;
import java.io.*;
import controlP5.*;
import nl.tue.id.datafoundry.*;

weka.classifiers.trees.J48 j48 = null;
Instances data = null;

// ------------------------------------------------------------------------
// settings for DataFoundry library
String host = "data.id.tue.nl";
String entity_api_token = "txyLQdlbhNlZqUkEY9XvzfwgqFwN85whZgXbFMniyg6HmFvujRZ0aYN4dFfUWtw/";
long entity_id = 907;
DataFoundry df = new DataFoundry(host);
DFDataset entityDS = df.dataset(entity_id, entity_api_token);
// ------------------------------------------------------------------------

String uname = "";
String db_dietgoal;
String db_dietpref;
String db_education;
String db_gender;
String db_age;
String db_weight;
String db_housesize;
String app_cuisine;
String app_hunger;
String app_activity;
String prediction;
int state = 1;
int rating;

//create array of class (object) Dish (so it's easy to search through the dishes with a for-loop)
Dish[] dishes = new Dish[50];
Dish[] selectedDishes;

ControlP5 cp5;
controlP5.Textfield username;
controlP5.Textfield password;
controlP5.Button submit;
controlP5.Button register;
controlP5.Button Profile;
controlP5.Textlabel title;
controlP5.Textlabel welcome;
controlP5.Textlabel mealLabel1;
controlP5.Textlabel mealLabel2;
controlP5.Textlabel mealLabel3;
controlP5.Textlabel feedback;
controlP5.ScrollableList cuisine;
controlP5.ScrollableList hunger;
controlP5.ScrollableList activity;
Slider abc;

void setup() {
  loadData(dataPath("Learning_data_pruned.csv"));
  size(375, 500);
  background(0);
  frameRate(20);
  noStroke();
  Label.setUpperCaseDefault(false);
  cp5 = new ControlP5(this);
  cp5components();
  InitiateMealDatabase();
  //j48Train();
  //saveModel(dataPath("j48.model"), j48);

  loadModel(dataPath("j48.model"));
  //println(predict("76-85", "26-35", "Asian", "Maintain Weight", "Vegetarian", 
  //  "HBO", "Female", "little hunger", "average activity", 2));
}

void draw() {
  background(0);
}

public void submit() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);

  if (state == 1) {
    setUname();
    setButtonStyle(submit, font, "Submit");
    return;
  }
  if (state == 2) {
    //mervyn's data input submit stuff.
    prediction = predict(db_weight, db_age, app_cuisine, db_dietgoal, db_dietpref, 
      db_education, db_gender, app_hunger, app_activity, 1);
      
    /************************************/  
    println(prediction);
    String predic = prediction.toString();
    //CheckDish(predic); // WEIRD: the [prediction] string is somehow not behaving like a normal string...
    println("prediction now: " + predic);
    CheckDish("vegetarian");  // (this works fine)
    /***************************************/
    
    PickRandomDish();
    
    feedback.setValue("Suggestions were given based on \nyour preference for " + predic + " dishes");
    interface3();
      setButtonStyle(submit, font, "Cook!");
    state = 3;
    return;
  }
  if (state == 3) {
    interface1();
    setButtonStyle(submit, font, "Submit");
    state = 1;
  }
}
