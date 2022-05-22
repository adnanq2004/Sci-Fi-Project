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
    //sfile = new SoundFile(this, "Mewmore Celadon City (Pokémon Red & Blue Remix).mp3");
    bimage = loadImage("space.jpg");
    background(bimage);
    fill(51,99,107,127);
    tint(127);
    rect(0,0,1000,100);
    rect(0,700,1000,100);
    //sfile.play();
    //sfile.loop();
    currentlevel = 0.1;
  }
  else if (currentlevel == 0.1) {
    fill(2,32,53,190);
    rect(width/2-300,200,600,100);
    fill(255);    
    text("hope you have fun~~", width/2-250, 225);
  }
}
