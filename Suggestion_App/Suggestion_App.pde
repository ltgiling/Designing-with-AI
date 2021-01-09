// ********************************************************
// Author: Lars Giling 
// Co-Authors: Mervyn Franssen, Jeroen Krukkert
// Date: Dec. 13, 2020
// Description: Code  to  collect and parse cooking data of
//              users,  sending  interaction  data  to Data 
//              Foundry for providing personalized feedback
// ********************************************************

import java.util.*;
import java.io.*;
import controlP5.*;
import nl.tue.id.datafoundry.*;

weka.classifiers.trees.J48 j48 = null;
Instances data = null;

void setup() {
  loadData(dataPath("Learning_data_pruned.csv"));
  //j48Train();
  //saveModel(dataPath("j48.model"), j48);
  loadModel(dataPath("j48.model"));
  println(predict("76-85", "26-35", "Asian", "Maintain Weight", 
  "Vegetarian", "HBO", "Female", "little hunger", "average activity", 2));
}
