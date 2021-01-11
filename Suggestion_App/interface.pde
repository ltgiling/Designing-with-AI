void cp5components() {
  PFont pfont = createFont("Arial", 18);
  ControlFont font = new ControlFont(pfont, 18);

  username = cp5.addTextfield("Username")
    .setPosition(37, 40)
    .setSize(200, 30)
    .setFont(font)
    .setId(1);

  password = cp5.addTextfield("Password")
    .setPosition(37, 100)
    .setSize(200, 30)
    .setFont(font)
    .setPasswordMode(true)
    .setId(2);

  submit = cp5.addButton("submit")
    .setPosition(37, 430)
    .setSize(100, 46)
    .setId(3);



  setTextfieldStyle(username, font, "User name");
  username.getCaptionLabel().getStyle().marginTop = -57;
  setTextfieldStyle(password, font, "Password"); 
  password.getCaptionLabel().getStyle().marginTop = -57;
  setButtonStyle(submit, font, "Login");
}
