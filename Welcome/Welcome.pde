import processing.sound.*;

double currentlevel;
int timenow;
SoundFile sfile;
PImage bimage;
PFont mono;

void setup() {
  size(1000, 800);
  fill(255);
  rect(-1,-1,1001,8001);
  timenow = second();
  currentlevel = 0.0;
}

void draw() {
  if (currentlevel == 0.0) {
    //begins setting up the menu.
    
    //prepares the soundfile and background image
    //sfile = new SoundFile(this, "Mewmore Celadon City (Pokémon Red & Blue Remix).mp3");
    bimage = loadImage("space.jpg");
    
    //plays the soundfile
    //sfile.play();
    //sfile.loop();
    
    currentlevel = 0.1;
  }
  else if (currentlevel == 0.1) {
    //begins the display of the menu
    
    //loads the background image and general layout
    stroke(0);
    background(bimage);
    fill(51,99,107,127);
    tint(127);
    rect(0,0,1000,100);
    rect(0,700,1000,100);
    
    //prepares the button placement

    //prepares the start button
    stroke(0);
    fill(2,32,53,190);
    rect(width/2-50,200,100,100);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("PLAY", width/2, 260);
    
    //prepares the achievements button
    stroke(0);
    fill(2,32,53,190);
    rect(width/2-80,350,160,100);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("ENDINGS", width/2, 410);
    
    //prepares the exit button
    stroke(0);
    fill(2,32,53,190);
    rect(width/2-50,500,100,100);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("EXIT", width/2, 560);
    
    currentlevel = 0.2;
  }
  else if (currentlevel == 0.2) {
    //waits for the user to press a button
    
    //check if mouse hovering over the play button
    if (mouseX > 450 && mouseX < 550 && mouseY < 300 && mouseY > 200) {
      //change the play button to show it is being hovered over.
      stroke(255);
      fill(55,107,126,190);
      rect(width/2-50,200,100,100);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("PLAY", width/2, 260);
      //check if mouse is being pressed
      if (mousePressed) {
        currentlevel = 1.0;
      }
    }
    //check if mouse hovering over endings button
    else if (mouseX > 420 && mouseX < 580 && mouseY < 450 && mouseY > 350) {
      //change the endings button to show it is being hovered over.
      stroke(255);
      fill(55,107,126,190);
      rect(width/2-80,350,160,100);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("ENDINGS", width/2, 410);
      //check if mouse is being pressed
      if (mousePressed) {
        currentlevel = 0.4;
      }
    }
    //check if mouse hovering over exit button
    else if (mouseX > 450 && mouseX < 550 && mouseY < 600 && mouseY > 500) {
      //change the exit button to show it is being hovered over.
      stroke(255);
      fill(55,107,126,190);
      rect(width/2-50,500,100,100);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("EXIT", width/2, 560);
      //check if the mouse is being pressed
      if (mousePressed) {
        exit();
      }
    }
    else {
      stroke(0);
      background(bimage);
      fill(51,99,107,127);
      tint(127);
      rect(0,0,1000,100);
      rect(0,700,1000,100);
      
      stroke(0);
      fill(2,32,53,190);
      rect(width/2-50,200,100,100);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("PLAY", width/2, 260);
      
      stroke(0);
      fill(2,32,53,190);
      rect(width/2-80,350,160,100);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("ENDINGS", width/2, 410);
      
      stroke(0);
      fill(2,32,53,190);
      rect(width/2-50,500,100,100);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("EXIT", width/2, 560);
    }
  }
}

//void mousePressed() {
//  println("{"+mouseX+", "+mouseY+"}");
//}
