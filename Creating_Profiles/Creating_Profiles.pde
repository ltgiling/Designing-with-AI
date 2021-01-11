import nl.tue.id.datafoundry.*;

// ------------------------------------------------------------------------
String host = "data.id.tue.nl";
String entity_api_token = "txyLQdlbhNlZqUkEY9XvzfwgqFwN85whZgXbFMniyg6HmFvujRZ0aYN4dFfUWtw/";
long entity_id = 907;
// ------------------------------------------------------------------------

DataFoundry df = new DataFoundry(host);
DFDataset entityDS = df.dataset(entity_id, entity_api_token);

void setup() {
  size(100,100);
  background(100);
  String uname = "Lars";
  entityDS.id(uname).token(uname);
  entityDS
  .data("weight", "85-95")
  .data("age", "18-25")
  .data("educationlvl", "WO")
  .data("gender", "Male")
  .data("dietgoal", "Lose Weight")
  .data("dietpref", "Meat")
  .data("householdsize", "4")
  .update();
}

void draw() { 
}
