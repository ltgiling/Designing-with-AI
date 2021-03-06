void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);
  ControlFont font2 = new ControlFont(pfont, 15);

  title = cp5.addTextlabel("title")
    .setPosition(25, 10)
    .setFont(createFont("Calibri", 30))
    .setValue("Meal suggestions through \nmachine learning")
    .setId(7); 

  username = cp5.addTextfield("Username")
    .setPosition(37, 110)
    .setSize(200, 30)
    .setFont(font)
    .setId(1);

  password = cp5.addTextfield("Password")
    .setPosition(37, 170)
    .setSize(200, 30)
    .setFont(font)
    .setPasswordMode(true)
    .setId(2);

  submit = cp5.addButton("submit")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(3);

  register = cp5.addButton("register")
    .setPosition(157, 430)
    .setSize(100, 46)
    .setId(4);

  welcome = cp5.addTextlabel("welcome")
    .setPosition(25, 80)
    .setFont(font)
    .setValue("Welcome")
    .setId(5)
    .setColorValue(0xffffff00)
    .hide();

  activity = cp5.addScrollableList("activity")
    .setPosition(35, 255)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("highly active", 1)
    .addItem("average activity", 2)
    .addItem("little activity", 3)
    .setValue(0)
    .setLabel("activity")
    .hide();
  this.activity.setItemHeight(25);
  activity.getCaptionLabel().getStyle().marginTop = 5;
  activity.getValueLabel().getStyle().marginTop = 5;

  hunger = cp5.addScrollableList("hunger")
    .setPosition(35, 195)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("very hungry", 1)
    .addItem("average hunger", 2)
    .addItem("little hunger", 3)
    .setValue(0)
    .setLabel("hunger")
    .hide();
  this.hunger.setItemHeight(25);
  hunger.getCaptionLabel().getStyle().marginTop = 5;
  hunger.getValueLabel().getStyle().marginTop = 5;

  cuisine = cp5.addScrollableList("cuisine")
    .setPosition(35, 135)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 250)
    .addItem("No preference", 1)
    .addItem("Asian", 2)
    .addItem("Dutch", 3)
    .addItem("Indian", 4)
    .addItem("Italian", 5)
    .setValue(0)
    .setLabel("cuisine")
    .hide();
  this.cuisine.setItemHeight(25);
  cuisine.getCaptionLabel().getStyle().marginTop = 5;
  cuisine.getValueLabel().getStyle().marginTop = 5;

  Profile = cp5.addButton("Profile")
    .setPosition(280, 88)
    .setSize(65, 26)
    .setId(5)
    .setFont(font2)
    .hide();

  setTextfieldStyle(username, font, "User name");
  username.getCaptionLabel().getStyle().marginTop = -57;
  setTextfieldStyle(password, font, "Password"); 
  password.getCaptionLabel().getStyle().marginTop = -57;
  setButtonStyle(submit, font, "Login");
  setButtonStyle(register, font, "Register");

  mealLabel1 = cp5.addTextlabel("mealLabel1")
    .setPosition(25, 110)
    .setFont(font)
    .setValue("")
    .setId(10)
    .hide();
  mealLabel2 = cp5.addTextlabel("mealLabel2")
    .setPosition(25, 145)
    .setFont(font)
    .setValue("")
    .setId(10)
    .hide();
  mealLabel3 = cp5.addTextlabel("mealLabel3")
    .setPosition(25, 180)
    .setFont(font)
    .setValue("")
    .setId(10)
    .hide();

  cp5.addSlider("Rating")
    .setPosition(225, 455)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Rate your \nrecommendation:")
    .setFont(font2)
    .hide();
  cp5.getController("Rating").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
  cp5.getController("Rating").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingY(20);
  
   feedback = cp5.addTextlabel("feedback")
    .setPosition(25, 365)
    .setFont(createFont("Calibri", 18))
    .setColorValue(0xffffff00)
    .setValue("Suggestions were given based on \nyour preference for (placeholder) dishes")
    .setId(7)
    .hide(); 
    
  seeMoreDishes = cp5.addButton("More suggestions >")
    .setPosition(30, 215)
    .setSize(140, 26)
    .setId(11)
    .setFont(font2)
    .hide();
}

void interface1() {
 cp5.getController("Username").show();
  cp5.getController("Password").show();
  cp5.getController("register").show();
  cp5.getController("welcome").hide();
  cp5.getController("Profile").hide();
  cp5.getController("cuisine").hide();
  cp5.getController("hunger").hide();
  cp5.getController("activity").hide();
  cp5.getController("mealLabel1").hide();
  cp5.getController("mealLabel2").hide();
  cp5.getController("mealLabel3").hide(); 
    cp5.getController("Rating").hide();
  cp5.getController("feedback").hide();
  cp5.getController("More suggestions >").hide();
}
void interface2() {
  cp5.getController("Username").hide();
  cp5.getController("Password").hide();
  cp5.getController("register").hide();
  cp5.getController("welcome").show();
  cp5.getController("Profile").show();
  cp5.getController("cuisine").show();
  cp5.getController("hunger").show();
  cp5.getController("activity").show();
  welcome.setValue("Welcome " + uname + ", what are you \neating today?");
  cp5.getController("mealLabel1").hide();
  cp5.getController("mealLabel2").hide();
  cp5.getController("mealLabel3").hide();
  cp5.getController("More suggestions >").hide();
}
void interface3() {
  cp5.getController("Username").hide();
  cp5.getController("Password").hide();
  cp5.getController("register").hide();
  cp5.getController("welcome").show();
  cp5.getController("Profile").hide();
  cp5.getController("cuisine").hide();
  cp5.getController("hunger").hide();
  cp5.getController("activity").hide();
  cp5.getController("mealLabel1").show();
  cp5.getController("mealLabel2").show();
  cp5.getController("mealLabel3").show();
  cp5.getController("Rating").show();
  cp5.getController("feedback").show();
  welcome.setValue("Personal suggestions:");
  cp5.getController("More suggestions >").show();
}
