void setUname() {
  uname = cp5.get(Textfield.class, "Username").getText();
  if (uname.isEmpty()) {
    uname = "noinput";
  }
  entityDS.id(uname).token(uname);
  Map Data = entityDS.get();
  String db_age = (String) Data.get("age");
  if (db_age != null) {
    String db_dietgoal = (String) Data.get("dietgoal");
    String db_dietpref = (String) Data.get("dietpref");
    String db_education = (String) Data.get("educationlvl");
    String db_gender = (String) Data.get("gender");
    String db_weight = (String) Data.get("weight");
    println("\nname: " + uname);
    print("gender: " + db_gender, "\ndiet goal :" + db_dietgoal);
    state = 1;
    interface2();
  } else {
    println("no account found");
  }
}
