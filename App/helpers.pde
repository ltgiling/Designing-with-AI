
//get the user name from the text field.
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

void setActual() {
  uname = cp5.get(Textfield.class, "username").getText();
  preftime = cp5.get(Textfield.class, "prefertime").getText();
  acttime = cp5.get(Textfield.class, "actualtime").getText();


} 

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

String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}
