void setUname() {
  uname = cp5.get(Textfield.class, "Username").getText();
  if (uname.isEmpty()) {
    uname = "noinput";
  }
  entityDS.id(uname).token(uname);
  Map Data = entityDS.get();
  db_age = (String) Data.get("age");
  if (db_age != null) {
    db_dietgoal = (String) Data.get("dietgoal");
    db_dietpref = (String) Data.get("dietpref");
    db_education = (String) Data.get("educationlvl");
    db_gender = (String) Data.get("gender");
    db_weight = (String) Data.get("weight");
    db_housesize = (String) Data.get("householdsize");
    println("\nname: " + uname);
    print("gender: " + db_gender, "\ndiet goal: " + db_dietgoal + "\n");
    state = 2;
    interface2();
  } else {
    println("no account found");
  }
}

void cuisine(int index) {
  app_cuisine = cp5.get(ScrollableList.class, "cuisine").getItem(index).get("name").toString();
}
void hunger(int index) {
  app_hunger = cp5.get(ScrollableList.class, "hunger").getItem(index).get("name").toString();
}
void activity(int index) {
  app_activity = cp5.get(ScrollableList.class, "activity").getItem(index).get("name").toString();
}
void Rating(int c_rate) {
  rating = c_rate;
}

String checkProfileItem(Object profileItem, String defaultValue) {
  return profileItem != null && ((String) profileItem).length() != 0 ? (String) profileItem : defaultValue;
}
