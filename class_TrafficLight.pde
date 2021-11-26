class TrafficLight {

  String state;
  int stateTimer;
  float xPos, yPos;

  TrafficLight(float _xPos, float _yPos, float _size) {
    xPos = _xPos;
    yPos = _yPos;
    size = _size;
    state = "GREEN";
    stateTimer = frameCount;
  }

  void render(boolean redLight, boolean yellowLight, boolean greenLight, boolean walkOn, boolean pressed) {
    pushMatrix();
    translate(xPos, yPos);
    renderTrafficLight(redLight, yellowLight, greenLight);
    renderWalkSignal(walkOn);
    renderButton(pressed);
    popMatrix();
  }

  void update() {
    // Update runs every frame and calls render()

    switch(state) {

    case "GREEN":
      render(false, false, true, false, false);
      break;

    case "YELLOW":
      render(false, true, false, false, false);
      if (frameCount - stateTimer > 60*1) {
        stateTimer = frameCount;
        state = "RED";
      }
      break;

    case "RED":
      render(true, false, false, true, false);
      if (frameCount - stateTimer > 60*4) {
        stateTimer = frameCount;
        state = "RED_YELLOW";
      }
      break;

    case "RED_YELLOW":
      render(true, true, false, false, false);
      if (frameCount - stateTimer > 60*1) {
        stateTimer = frameCount;
        state = "GREEN";
      }
      break;
    }
    //Check the button every frame
    if (buttonPressed()) {
      state = "YELLOW";
      println("Button pressed");
    }
  }


  void renderTrafficLight(boolean redOn, boolean yellowOn, boolean greenOn) {
    fill(black);
    rect(0*size, 0*size, 100*size, 300*size);
    rect(25*size, 300*size, 50*size, 150*size);
    imageMode(CENTER);


    if (redOn) {
      fill(redLight);
      ellipse(50*size, 50*size, 75*size, 75*size);
    } else {
      fill(redOff);
      ellipse(50*size, 50*size, 75*size, 75*size);
    }

    if (yellowOn) {
      fill(yellowLight);
      ellipse(50*size, 150*size, 75*size, 75*size);
    } else {
      fill(yellowOff);
      ellipse(50*size, 150*size, 75*size, 75*size);
    }

    if (greenOn) {
      fill(greenLight);
      ellipse(50*size, 250*size, 75*size, 75*size);
    } else {
      fill(greenOff);
      ellipse(50*size, 250*size, 75*size, 75*size);
    }
  }

  void renderWalkSignal(boolean walkOn) {
    // This function renders a walk signal

    color black = color(0);
    color redLight = color(255, 0, 0 );
    color greenLight = color(0, 255, 0);
    color offLight = color(200);



    // Render the "box"
    fill(black);
    rect(200*size, 0*size, 100*size, 200*size);
    rect(225*size, 200*size, 50*size, 50*size);
    rect(225*size, 300*size, 50*size, 150*size);

    // Render red/green light if false/true
    if (walkOn) {
      fill(greenLight);
      ellipse(250*size, 150*size, 75*size, 75*size);
      fill(offLight);
      ellipse(250*size, 50*size, 75*size, 75*size);
    } else {
      fill(redLight);
      ellipse(250*size, 50*size, 75*size, 75*size);
      fill(offLight);
      ellipse(250*size, 150*size, 75*size, 75*size);
    }
  }

  void renderButton(boolean pressed) {
    float borderSize = 100*size;
    float buttonsize = 80*size;
    color pressedOn = color(0, 0, 200);
    color pressedOff = color(0, 0, 255);

    fill(0);
    rect(200*size, 250*size, borderSize, borderSize);
    ellipseMode(CENTER);

    if (pressed) {
      fill(pressedOn);
    } else {
      fill(pressedOff);
    }
    ellipse(250*size, 300*size, buttonsize, buttonsize);
  }

  boolean buttonPressed() { // Returns true if the button is pressed, false otherwise
    if (mousePressed && sqrt(sq(mouseX-(xPos+(250*size)))+sq(mouseY-(yPos+(300*size)))) < 40*size) {
      return true;
    } else {
      return false;
    }
  }
}
