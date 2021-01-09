void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);
  ControlFont dishFont = new ControlFont(pfont, 12); 

  /*  cp5.addSlider("Difficulty")
   .setPosition(185, 325)
   .setSize(100, 20)
   .setRange(1, 5)
   .setNumberOfTickMarks(5)
   .setLabel("Difficulty:")
   .setFont(font);
   cp5.getController("Difficulty").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
   
   cp5.addSlider("Spiciness")
   .setPosition(185, 380)
   .setSize(100, 20)
   .setRange(1, 5)
   .setNumberOfTickMarks(5)
   .setLabel("Preferred spiciness:")
   .setFont(font);
   cp5.getController("Spiciness").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);
   */
  cp5.addSlider("Householdsize")
    .setPosition(185, 355)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Size household:")
    .setFont(font);
  cp5.getController("Householdsize").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  cp5.addSlider("Rating")
    .setPosition(235, 385)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Meal rating:")
    .setFont(font);
  cp5.getController("Rating").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  username = cp5.addTextfield("Username")
    .setPosition(37, 75)
    .setSize(300, 30)
    .setFont(font)
    .setId(1);
  // cp5.getController("Username").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  /*
  prefertime = cp5.addTextfield("prefertime")
   .setPosition(37, 175)
   .setSize(40, 30)
   .setFont(font)
   .setId(2);
   
   preferkcal = cp5.addTextfield("preferkcal")
   .setPosition(37, 255)
   .setSize(40, 30)
   .setFont(font)
   .setId(8);
   */
  weight = cp5.addScrollableList("weight")
    .setPosition(37, 255)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(130, 150)
    .addItem("55-65", 1)
    .addItem("66-75", 2)
    .addItem("76-85", 3)
    .addItem("86-95", 4)
    .addItem("96-105", 5)
    .addItem("106-115", 6)
    .addItem("116+", 7)
    .setValue(0)
    .setLabel("weight (kg)");
  this.weight.setItemHeight(25);
  weight.getCaptionLabel().getStyle().marginTop = 5;
  weight.getValueLabel().getStyle().marginTop = 5;

  age = cp5.addScrollableList("age")
    .setPosition(37, 155)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(130, 150)
    .addItem("18-25", 1)
    .addItem("26-35", 2)
    .addItem("36-45", 3)
    .addItem("46-55", 4)
    .addItem("56-65", 5)
    .addItem("66-75", 6)
    .addItem("76+", 7)
    .setValue(0)
    .setLabel("age");
  this.age.setItemHeight(25);
  age.getCaptionLabel().getStyle().marginTop = 5;
  age.getValueLabel().getStyle().marginTop = 5;

  submit = cp5.addButton("submit")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(3);

  actualtime = cp5.addTextfield("actualtime")
    .setPosition(37, 375)
    .setSize(40, 30)
    .setFont(font)
    .setId(4);   

  title = cp5.addTextlabel("title")
    .setPosition(25, 10)
    .setFont(createFont("Calibri", 30))
    .setValue("Personal meal suggestions")
    .setId(7); 

  timelabel = cp5.addTextlabel("timelabel")
    .setPosition(25, 45)
    .setFont(font)
    .setValue("Suggested meals:")
    .setId(5);

  timelabel2 = cp5.addTextlabel("timelabel2")
    .setPosition(182, 145)
    .setFont(font)
    .setValue("Meal Preferences:")
    .setId(6);

  /********************dish buttons*****************************/
  dish1 = cp5.addButton("dish1")
    .setPosition(37, 380)
    .setSize(100, 46)
    .setId(16);

  dish2 = cp5.addButton("dish2")
    .setPosition(137, 380)
    .setSize(100, 46)
    .setId(16);

  dish3 = cp5.addButton("dish3")
    .setPosition(237, 380)
    .setSize(100, 46)
    .setId(16);

  dish4 = cp5.addButton("dish4")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(16);

  dish5 = cp5.addButton("dish5")
    .setPosition(137, 430)
    .setSize(100, 46)
    .setId(16);

  /******************* dish labels *****************************/
  dishlabel1 = cp5.addTextlabel("dishlabel1")
    .setPosition(25, 75)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(11);
  dishlabel2 = cp5.addTextlabel("dishlabel2")
    .setPosition(25, 115)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(12);
  dishlabel3 = cp5.addTextlabel("dishlabel3")
    .setPosition(25, 155)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(13);
  dishlabel4 = cp5.addTextlabel("dishlabel4")
    .setPosition(25, 195)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(14);
  dishlabel5 = cp5.addTextlabel("dishlabel5")
    .setPosition(25, 235)
    .setFont(font)
    .setValue("")
    .setColorValue(0xffffff00)
    .setId(15);
  /********************* attribute labels **********************/
  priceLabel1 = cp5.addTextlabel("priceLabel1")
    .setPosition(45, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel1 = cp5.addTextlabel("difficultyLabel1")
    .setPosition(110, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel1 = cp5.addTextlabel("spicynessLabel1")
    .setPosition(180, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel1 = cp5.addTextlabel("kcalLabel1")
    .setPosition(235, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel1 = cp5.addTextlabel("timetocookLabel1")
    .setPosition(295, 95)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel2 = cp5.addTextlabel("priceLabel2")
    .setPosition(45, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel2 = cp5.addTextlabel("difficultyLabel2")
    .setPosition(110, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel2 = cp5.addTextlabel("spicynessLabel2")
    .setPosition(180, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel2 = cp5.addTextlabel("kcalLabel2")
    .setPosition(235, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel2 = cp5.addTextlabel("timetocookLabel2")
    .setPosition(295, 135)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel3 = cp5.addTextlabel("priceLabel3")
    .setPosition(45, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel3 = cp5.addTextlabel("difficultyLabel3")
    .setPosition(110, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel3 = cp5.addTextlabel("spicynessLabel3")
    .setPosition(180, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel3 = cp5.addTextlabel("kcalLabel3")
    .setPosition(235, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel3 = cp5.addTextlabel("timetocookLabel3")
    .setPosition(295, 175)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel4 = cp5.addTextlabel("priceLabel4")
    .setPosition(45, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel4 = cp5.addTextlabel("difficultyLabel4")
    .setPosition(110, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel4 = cp5.addTextlabel("spicynessLabel4")
    .setPosition(180, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel4 = cp5.addTextlabel("kcalLabel4")
    .setPosition(235, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel4 = cp5.addTextlabel("timetocookLabel4")
    .setPosition(295, 215)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  priceLabel5 = cp5.addTextlabel("priceLabel5")
    .setPosition(45, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  difficultyLabel5 = cp5.addTextlabel("difficultyLabel5")
    .setPosition(110, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  spicynessLabel5 = cp5.addTextlabel("spicynessLabel5")
    .setPosition(180, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  kcalLabel5 = cp5.addTextlabel("kcalLabel5")
    .setPosition(235, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  timetocookLabel5 = cp5.addTextlabel("timetocookLabel5")
    .setPosition(295, 255)
    .setFont(dishFont)
    .setValue("")
    .setId(17);
  /*
  price = cp5.addScrollableList("price")
   .setPosition(185, 255)
   .setFont(font)
   .setItemHeight(10)
   .setBarHeight(30)
   .setSize(150, 150)
   .addItem("No preference", 1)
   .addItem("$", 2)
   .addItem("$$", 3)
   .addItem("$$$", 4)
   .setValue(0)
   .setLabel("price range");
   this.price.setItemHeight(25);
   price.getCaptionLabel().getStyle().marginTop = 5;
   price.getValueLabel().getStyle().marginTop = 5;
   */
  basis = cp5.addScrollableList("basis")
    .setPosition(185, 215)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Rice", 2)
    .addItem("Potatoes", 3)
    .addItem("Chicken", 4)
    .addItem("Noodles", 5)
    .addItem("Lettuce", 6)
    .setValue(0)
    .setLabel("Ingredient preference"); 
  this.basis.setItemHeight(25);
  basis.getCaptionLabel().getStyle().marginTop = 5;
  basis.getValueLabel().getStyle().marginTop = 5; 

  cuisine = cp5.addScrollableList("cuisine")
    .setPosition(185, 175)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Asian", 2)
    .addItem("Dutch", 3)
    .addItem("Indian", 4)
    .addItem("Italian", 5)
    .setValue(0)
    .setLabel("cuisine");
  this.cuisine.setItemHeight(25);
  cuisine.getCaptionLabel().getStyle().marginTop = 5;
  cuisine.getValueLabel().getStyle().marginTop = 5;

  educationlvl = cp5.addScrollableList("educationlvl")
    .setPosition(185, 285)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("None", 1)
    .addItem("Primary School", 2)
    .addItem("High School", 3)
    .addItem("MBO", 4)
    .addItem("HBO", 5)
    .addItem("WO", 6)
    .setValue(0)
    .setLabel("education level"); 
  this.educationlvl.setItemHeight(25);
  educationlvl.getCaptionLabel().getStyle().marginTop = 5;
  educationlvl.getValueLabel().getStyle().marginTop = 5; 

  dietpref = cp5.addScrollableList("dietpref")
    .setPosition(185, 235)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Vegan", 2)
    .addItem("Vegetarian", 3)
    .addItem("Meat", 4)
    .setValue(0)
    .setLabel("diet preference");
  this.dietpref.setItemHeight(25);
  dietpref.getCaptionLabel().getStyle().marginTop = 5;
  dietpref.getValueLabel().getStyle().marginTop = 5; 

  dietgoal = cp5.addScrollableList("dietgoal")
    .setPosition(185, 185)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Maintain Weight", 2)
    .addItem("Gain Weight", 3)
    .addItem("Lose Weight", 4)
    .setValue(0)
    .setLabel("diet goal");
  this.dietgoal.setItemHeight(25);
  dietgoal.getCaptionLabel().getStyle().marginTop = 5;
  dietgoal.getValueLabel().getStyle().marginTop = 5;  

  gender = cp5.addScrollableList("gender")
    .setPosition(185, 135)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Female", 2)
    .addItem("Male", 3)
    .setValue(0)
    .setLabel("gender");
  this.gender.setItemHeight(25);
  gender.getCaptionLabel().getStyle().marginTop = 5;
  gender.getValueLabel().getStyle().marginTop = 5;

  // set components style to display: textfields, buttons
  // setTextfieldStyle(username, font, "User name");
  //setTextfieldStyle(prefertime, font, "Preferred \ncooking time");
  //setTextfieldStyle(preferkcal, font, "Preferred \nkcal in meal");
  setTextfieldStyle(actualtime, font, "Actual time \nspent cooking");
  setButtonStyle(submit, font, "Continue");
  setButtonStyle(dish1, font, "Dish 1");
  setButtonStyle(dish2, font, "Dish 2");
  setButtonStyle(dish3, font, "Dish 3");
  setButtonStyle(dish4, font, "Dish 4");
  setButtonStyle(dish5, font, "Dish 5");
}
void interface1() {
  //show and hide components for first interface
  //first interface for user data
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").show();
  cp5.getController("age").show();
  cp5.getController("gender").show();
  cp5.getController("dietgoal").show();
  cp5.getController("dietpref").show();
  cp5.getController("weight").show();
  cp5.getController("Householdsize").show();
  cp5.getController("educationlvl").show();
  //cp5.getController("prefertime").hide();
  //cp5.getController("preferkcal").hide();
  //cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  //cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  //cp5.getController("Difficulty").hide();
  //Hide dish buttons
  cp5.getController("dish1").hide();
  cp5.getController("dish2").hide();
  cp5.getController("dish3").hide();
  cp5.getController("dish4").hide();
  cp5.getController("dish5").hide();
  cp5.getController("submit").show();
  //dishlabels
  cp5.getController("dishlabel1").hide();
  cp5.getController("dishlabel2").hide();
  cp5.getController("dishlabel3").hide();
  cp5.getController("dishlabel4").hide();
  cp5.getController("dishlabel5").hide();
  //attribute labels
  cp5.getController("priceLabel1").hide();
  cp5.getController("difficultyLabel1").hide();
  cp5.getController("spicynessLabel1").hide();
  cp5.getController("kcalLabel1").hide();
  cp5.getController("timetocookLabel1").hide();
  cp5.getController("priceLabel2").hide();
  cp5.getController("difficultyLabel2").hide();
  cp5.getController("spicynessLabel2").hide();
  cp5.getController("kcalLabel2").hide();
  cp5.getController("timetocookLabel2").hide();
  cp5.getController("priceLabel3").hide();
  cp5.getController("difficultyLabel3").hide();
  cp5.getController("spicynessLabel3").hide();
  cp5.getController("kcalLabel3").hide();
  cp5.getController("timetocookLabel3").hide();
  cp5.getController("priceLabel4").hide();
  cp5.getController("difficultyLabel4").hide();
  cp5.getController("spicynessLabel4").hide();
  cp5.getController("kcalLabel4").hide();
  cp5.getController("timetocookLabel4").hide();
  cp5.getController("priceLabel5").hide();
  cp5.getController("difficultyLabel5").hide();
  cp5.getController("spicynessLabel5").hide();
  cp5.getController("kcalLabel5").hide();
  cp5.getController("timetocookLabel5").hide();
}
void interface2() {
  //show and hide components for second interface
  //second interface for meal data
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  //cp5.getController("Spiciness").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("gender").hide();
  cp5.getController("dietgoal").hide();
  cp5.getController("dietpref").hide();
  cp5.getController("weight").hide();
  cp5.getController("Householdsize").hide();
  cp5.getController("educationlvl").hide();
  //cp5.getController("preferkcal").show();
  //cp5.getController("price").show();
  cp5.getController("cuisine").show();
  //cp5.getController("prefertime").show();
  cp5.getController("basis").show();
  //cp5.getController("Difficulty").show();
  //Hide dish buttons
  cp5.getController("dish1").hide();
  cp5.getController("dish2").hide();
  cp5.getController("dish3").hide();
  cp5.getController("dish4").hide();
  cp5.getController("dish5").hide();
  cp5.getController("submit").show();
  //dishlabels
  cp5.getController("dishlabel1").hide();
  cp5.getController("dishlabel2").hide();
  cp5.getController("dishlabel3").hide();
  cp5.getController("dishlabel4").hide();
  cp5.getController("dishlabel5").hide();
}
void interface3() {
  //show and hide components for third interface
  //third interface for meal suggestion
  cp5.getController("actualtime").hide();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").hide();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("gender").hide();
  cp5.getController("dietgoal").hide();
  cp5.getController("dietpref").hide();
  cp5.getController("weight").hide();
  cp5.getController("Householdsize").hide();
  cp5.getController("educationlvl").hide();
  //cp5.getController("prefertime").hide();
  //cp5.getController("preferkcal").hide();
  //cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  //cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  //cp5.getController("Difficulty").hide();
  //Show dish buttons
  cp5.getController("dish1").show();
  cp5.getController("dish2").show();
  cp5.getController("dish3").show();
  cp5.getController("dish4").show();
  cp5.getController("dish5").show();
  cp5.getController("submit").hide();
  //dishlabels
  cp5.getController("dishlabel1").show();
  cp5.getController("dishlabel2").show();
  cp5.getController("dishlabel3").show();
  cp5.getController("dishlabel4").show();
  cp5.getController("dishlabel5").show();
  //attribute labels
  cp5.getController("priceLabel1").show();
  cp5.getController("difficultyLabel1").show();
  cp5.getController("spicynessLabel1").show();
  cp5.getController("kcalLabel1").show();
  cp5.getController("timetocookLabel1").show();
  cp5.getController("priceLabel2").show();
  cp5.getController("difficultyLabel2").show();
  cp5.getController("spicynessLabel2").show();
  cp5.getController("kcalLabel2").show();
  cp5.getController("timetocookLabel2").show();
  cp5.getController("priceLabel3").show();
  cp5.getController("difficultyLabel3").show();
  cp5.getController("spicynessLabel3").show();
  cp5.getController("kcalLabel3").show();
  cp5.getController("timetocookLabel3").show();
  cp5.getController("priceLabel4").show();
  cp5.getController("difficultyLabel4").show();
  cp5.getController("spicynessLabel4").show();
  cp5.getController("kcalLabel4").show();
  cp5.getController("timetocookLabel4").show();
  cp5.getController("priceLabel5").show();
  cp5.getController("difficultyLabel5").show();
  cp5.getController("spicynessLabel5").show();
  cp5.getController("kcalLabel5").show();
  cp5.getController("timetocookLabel5").show();
}
void interface4() {
  //show and hide components for fourth interface
  //fourth interface for meal (suggestion) rating
  cp5.getController("actualtime").show();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").show();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("gender").hide();
  cp5.getController("dietgoal").hide();
  cp5.getController("dietpref").hide();
  cp5.getController("weight").hide();
  cp5.getController("Householdsize").hide();
  cp5.getController("educationlvl").hide();
  //cp5.getController("prefertime").hide();
  //cp5.getController("preferkcal").hide();
  //cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  //cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  //cp5.getController("Difficulty").hide();
  //Hide dish buttons
  cp5.getController("dish1").hide();
  cp5.getController("dish2").hide();
  cp5.getController("dish3").hide();
  cp5.getController("dish4").hide();
  cp5.getController("dish5").hide();
  cp5.getController("submit").show();
  //dishlabels
  cp5.getController("dishlabel1").hide();
  cp5.getController("dishlabel2").hide();
  cp5.getController("dishlabel3").hide();
  cp5.getController("dishlabel4").hide();
  cp5.getController("dishlabel5").hide();
  //attribute labels
  cp5.getController("priceLabel1").hide();
  cp5.getController("difficultyLabel1").hide();
  cp5.getController("spicynessLabel1").hide();
  cp5.getController("kcalLabel1").hide();
  cp5.getController("timetocookLabel1").hide();
  cp5.getController("priceLabel2").hide();
  cp5.getController("difficultyLabel2").hide();
  cp5.getController("spicynessLabel2").hide();
  cp5.getController("kcalLabel2").hide();
  cp5.getController("timetocookLabel2").hide();
  cp5.getController("priceLabel3").hide();
  cp5.getController("difficultyLabel3").hide();
  cp5.getController("spicynessLabel3").hide();
  cp5.getController("kcalLabel3").hide();
  cp5.getController("timetocookLabel3").hide();
  cp5.getController("priceLabel4").hide();
  cp5.getController("difficultyLabel4").hide();
  cp5.getController("spicynessLabel4").hide();
  cp5.getController("kcalLabel4").hide();
  cp5.getController("timetocookLabel4").hide();
  cp5.getController("priceLabel5").hide();
  cp5.getController("difficultyLabel5").hide();
  cp5.getController("spicynessLabel5").hide();
  cp5.getController("kcalLabel5").hide();
  cp5.getController("timetocookLabel5").hide();
}
