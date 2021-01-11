// *****************************************************
// Author: Lars Giling 
// Co-Authors: Mervyn Franssen, Jeroen Krukkert
// Date: January 11, 2021
// Description: Code to apply J48 ML model to user input
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

String uname;

ControlP5 cp5;
controlP5.Textfield username;

void setup() {
  loadData(dataPath("Learning_data_pruned.csv"));
  size(375, 500);
  background(0);
  noStroke();
  cp5components();

  Label.setUpperCaseDefault(false);
  cp5 = new ControlP5(this);
  //j48Train();
  //saveModel(dataPath("j48.model"), j48);

  //loadModel(dataPath("j48.model"));
  //println(predict("76-85", "26-35", "Asian", "Maintain Weight", 
  //"Vegetarian", "HBO", "Female", "little hunger", "average activity", 2));
}

void draw() {
  submit();
}

public void submit() {
  setUname();
}
