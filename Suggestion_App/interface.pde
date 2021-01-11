void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);
  
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
    .hide();; 
    
  setTextfieldStyle(username, font, "User name");
  username.getCaptionLabel().getStyle().marginTop = -57;
  setTextfieldStyle(password, font, "Password"); 
  password.getCaptionLabel().getStyle().marginTop = -57;
  setButtonStyle(submit, font, "Login");
  setButtonStyle(register, font, "Register");
}
void interface2(){
  cp5.getController("Username").hide();
  cp5.getController("Password").hide();
  cp5.getController("register").hide();
  cp5.getController("welcome").show();
  welcome.setValue("Welcome " + uname + ", what are you \neating today?");
}
void interface3(){
  
  
}
