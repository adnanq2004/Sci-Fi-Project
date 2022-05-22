import processing.sound.*;

double currentlevel;
int timenow;
SoundFile sfile;
PImage bimage;

void setup() {
  size(1000, 800);
  fill(255);
  rect(-1,-1,1001,8001);
  timenow = second();
  currentlevel = 0.0;
}

void draw() {
  if (currentlevel == 0.0) {
    sfile = new SoundFile(this, "Mewmore Celadon City (Pokémon Red & Blue Remix).mp3");
    bimage = loadImage("space.jpg");
    background(bimage);
    sfile.play();
    sfile.loop();
    currentlevel = 0.1;
  }
  else if (currentlevel == 0.1) {
  }
}
