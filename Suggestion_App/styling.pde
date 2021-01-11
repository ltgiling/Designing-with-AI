// styling of UI ---------------------------------------------------------------------------

void setTextfieldStyle(controlP5.Textfield tf, ControlFont cf, String txt) {
  tf.getCaptionLabel()
    .setFont(cf)
    .toUpperCase(false)
    .setText(txt);
  tf.getCaptionLabel().getStyle().marginTop = -75;
}

void setButtonStyle(controlP5.Button btn, ControlFont cf, String label) {
  btn.getCaptionLabel()
    .setFont(cf)
    .setSize(20)
    .toUpperCase(false)
    .setText(label);
}
