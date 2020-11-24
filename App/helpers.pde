
//get the user name and preferred time from the text field.
void setUname() {
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
}
//on the second screen, get the values that were submitted
void setActual() {
  uname = cp5.get(Textfield.class, "username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();
  acttime = cp5.get(Textfield.class, "actualtime").getText();
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

//makes sure calculations aren't done with empty fields
String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}
