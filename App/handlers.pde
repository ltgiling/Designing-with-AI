//get the user name and preferred time from the text field.
void setUname() {
  uname = cp5.get(Textfield.class, "Username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();
  prefkcal = cp5.get(Textfield.class, "preferkcal").getText();
  userage = cp5.get(Textfield.class, "preferkcal").getText();
  userweight = cp5.get(Textfield.class, "weight").getText();

  // if the text field is empty, random Id!
  if (uname.isEmpty()) {
    uname = "rand" + round(random(1000, 20000));
    username.setText(uname);
  }
  if (preftime.isEmpty()) {
    preftime = "0";
    prefertime.setText(preftime);
  } 
  if (prefkcal.isEmpty()) {
    prefkcal = "0";
    preferkcal.setText(prefkcal);
  }
   if (userage.isEmpty()) {
    userage = "0";
    age.setText(userage);
  }
   if (userweight.isEmpty()) {
    userweight = "0";
    weight.setText(userweight);
  }
}
//on the second screen, get the values that were submitted
void setActual() {
  uname = cp5.get(Textfield.class, "Username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();
  prefkcal = cp5.get(Textfield.class, "preferkcal").getText();
  userage = cp5.get(Textfield.class, "age").getText();
  userweight = cp5.get(Textfield.class, "weight").getText();
  acttime = cp5.get(Textfield.class, "actualtime").getText();
  
  if (acttime.isEmpty()) {
    acttime = "0";
    actualtime.setText(acttime);
  }
} 

//fetch data from data foundry and parse strings to integers where needed
//calculate the relative speed of the user over all of their inputs
void fetchData() {
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
void cuisine(int index) {
  prefcuisine = cp5.get(ScrollableList.class, "cuisine").getItem(index).get("name").toString();
}
void price(int index) {
  prefprice = cp5.get(ScrollableList.class, "price").getItem(index).get("name").toString();
}
void basis(int index3) {
  base = cp5.get(ScrollableList.class, "basis").getItem(index3).get("name").toString();
}
void Difficulty(int c_diff){
  diffrating = c_diff;
}
void Rating(int c_rate){
  rate = c_rate;
}
void Spiciness(int c_spice){
  spicyrating = c_spice;
}

//makes sure calculations aren't done with empty fields
String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}
