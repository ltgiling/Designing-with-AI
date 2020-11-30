void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);  

  cp5.addSlider("Difficulty")
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

  cp5.addSlider("Rating")
    .setPosition(235, 385)
    .setSize(100, 20)
    .setRange(1, 5)
    .setNumberOfTickMarks(5)
    .setLabel("Rating:")
    .setFont(font)
    .hide();
  cp5.getController("Rating").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);

  username = cp5.addTextfield("Username")
    .setPosition(37, 75)
    .setSize(300, 30)
    .setFont(font)
    .setId(1);
  cp5.getController("Username").getCaptionLabel().align(ControlP5.LEFT, ControlP5.TOP_OUTSIDE).setPaddingX(0);


  prefertime = cp5.addTextfield("prefertime")
    .setPosition(37, 175)
    .setSize(40, 30)
    .setFont(font)
    .setId(2);
    
  preferkcal = cp5.addTextfield("preferkcal")
    .setPosition(37, 205)
    .setSize(40, 30)
    .setFont(font)
    .setId(8);
    
  age = cp5.addTextfield("age")
    .setPosition(37, 175)
    .setSize(40, 30)
    .setFont(font)
    .setId(8);

  submit = cp5.addButton("submit")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(3);

  actualtime = cp5.addTextfield("actualtime")
    .setPosition(37, 375)
    .setSize(100, 40)
    .setFont(font)
    .setId(4)
    .hide();   

  title = cp5.addTextlabel("title")
    .setPosition(25, 10)
    .setFont(createFont("Calibri", 30))
    .setValue("Personal meal suggestions")
    .setId(7); 

  timelabel = cp5.addTextlabel("timelabel")
    .setPosition(25, 45)
    .setFont(font)
    .setValue("Suggested meals:")
    .setId(5)
    .hide();

  timelabel2 = cp5.addTextlabel("timelabel2")
    .setPosition(182, 145)
    .setFont(font)
    .setValue("Meal Preferences:")
    .setId(6);

  basis = cp5.addScrollableList("basis")
    .setPosition(185, 215)
    .setFont(font)
    .setItemHeight(10)
    .setBarHeight(30)
    .setSize(150, 150)
    .addItem("No preference", 1)
    .addItem("Rice", 2)
    .addItem("Potato", 3)
    .addItem("Bread", 4)
    .addItem("Pasta", 5)
    .addItem("Lettuce", 6)
    .setValue(0)
    .setLabel("base ingredient"); 
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

  // set components style to display: textfields, buttons
  //setTextfieldStyle(username, font, "User name");
  setTextfieldStyle(prefertime, font, "Preferred \ncooking time");
  setTextfieldStyle(actualtime, font, "Actual cooking time");
  setButtonStyle(submit, font, "Submit");
}
void interface1() {
  //show and hide components for first interface
  //first interface for user data
  //cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").show();
  cp5.getController("age").show();
  cp5.getController("prefertime").hide();
  cp5.getController("preferkcal").hide();
  cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  cp5.getController("Difficulty").hide();
}
void interface2() {
  //show and hide components for second interface
  //second interface for meal data
  //cp5.getController("actualtime").hide();
  cp5.getController("timelabel").hide();
  cp5.getController("timelabel2").show();
  cp5.getController("Spiciness").show();
  cp5.getController("Rating").hide();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("preferkcal").show();
  cp5.getController("price").show();
  cp5.getController("cuisine").show();
  cp5.getController("prefertime").show();
  cp5.getController("basis").show();
  cp5.getController("Difficulty").show();
}
void interface3() {
  //show and hide components for third interface
  //third interface for meal suggestion
  //cp5.getController("actualtime").hide();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").hide();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("prefertime").hide();
  cp5.getController("preferkcal").hide();
  cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  cp5.getController("Difficulty").hide();
}
void interface4() {
  //show and hide components for fourth interface
  //fourth interface for meal (suggestion) rating
  //cp5.getController("actualtime").show();
  cp5.getController("timelabel").show();
  cp5.getController("timelabel2").hide();
  cp5.getController("Rating").show();
  cp5.getController("Username").hide();
  cp5.getController("age").hide();
  cp5.getController("prefertime").hide();
  cp5.getController("preferkcal").hide();
  cp5.getController("price").hide();
  cp5.getController("cuisine").hide();
  cp5.getController("Spiciness").hide();
  cp5.getController("basis").hide();
  cp5.getController("Difficulty").hide();
}
