import processing.sound.*;
import java.io.*;
import java.util.ArrayList;

double currentlevel;
double timenow;
SoundFile sfile;
PImage bimage;
PFont mono;
Scene current_scene;
ArrayList<String> text = new ArrayList<String>();

void setup() {
  size(1000, 800);
  fill(255);
  rect(-1,-1,1001,801);
  timenow = second();
  currentlevel = 0.0;
  
  //all of the scenes are going here.
  text.clear();
  text.add("In the chocolate-syrup galaxy, sector 51479...");
  Scene A1 = new Single(text,"red_space.jpg","none",false,"Narrator");
  current_scene = A1;
  
  text.clear();
  text.add("Laaaaaaaaaadies and gentlemeeeeeeeeen!");
  text.add("I'm happy to start the final race");
  text.add("of the 31st Scelerisque Spatium Circuit!");
  Scene A2 = new Single(text, "red_space.jpg", "none", false, "Announcer");
  A1.next_scene = A2;
  A2.last_scene = A1;
  
}

void draw() {
  if (currentlevel == 0.0) {
    //begins setting up the menu.
    
    //prepares the soundfile and background image
    sfile = new SoundFile(this, "music/Mewmore Celadon City (Pokémon Red & Blue Remix).mp3");
    bimage = loadImage("space.jpg");
    
    //plays the soundfile
    sfile.play();
    sfile.loop();
    
    currentlevel = 0.1;
  }
  else if (currentlevel == 0.1) {
    menu_ui();
    
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
        if (sfile.isPlaying()) {
          sfile.stop();
        }
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
      text("SPECIAL", width/2, 410);
      //check if mouse is being pressed
      if (mousePressed) {
        currentlevel = 0.3;
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
      menu_ui();
    }
  }
  else if (currentlevel == 0.3) {
    special_ui();
    
    currentlevel = 0.4;
  }
  else if (currentlevel == 0.4) {
    if (mouseX > 820 && mouseX < 980 && mouseY > 710 && mouseY < 790) {
      stroke(255);
      fill(55,107,126,190);
      rect(820,710,160,80);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("BACK", 900, 760);
      
      if (mousePressed) {
        currentlevel = 0.1;
      }
    }
    else {
      special_ui();
    }
  }
  else if (currentlevel == 1.0) {
    if ((current_scene.music).equals("stop")) {
      if (sfile.isPlaying()) {
        sfile.stop();
      }
    }
    else if (!current_scene.music.equals("none")) {
      sfile = new SoundFile(this, current_scene.music);
      sfile.play();
      if (current_scene.loop) {
        sfile.loop();
      }
    }
    levels_ui();
    currentlevel = 1.1;
  }
  else if (currentlevel == 1.1) {
    levels_ui();
    currentlevel = 1.2;
  }
  else if (currentlevel == 1.2) {
    if (current_scene.isS()) {
      //check if hovering over back
      if (mouseX > 20 && mouseX < 180 && mouseY > 710 && mouseY < 790) {
        stroke(255);
        fill(55,107,126,190);
        rect(20,710,160,80);
        fill(255);
        textAlign(CENTER);
        textSize(30);
        text("BACK", 100, 760);
        
        if (mousePressed) {
          if (current_scene.last_scene != null) {
            current_scene = current_scene.last_scene;
            currentlevel = 1.0;
          }
          else {
            currentlevel = 0.0;
          }
        }
      }
      //check if hovering over exit
      else if (mouseX>width/2-80 && mouseX < width/2+80 && mouseY > 710 && mouseY < 790) {
        stroke(255);
        fill(55,107,126,190);
        rect(width/2-80,710,160,80);
        fill(255);
        textAlign(CENTER);
        textSize(30);
        text("MENU", width/2, 760);
        
        if (mousePressed) {
          currentlevel = 0.0;
        }
      }
      //check if hovering over next
      else if (mouseX > 820 && mouseX < 980 && mouseY > 710 && mouseY < 790) {
        stroke(255);
        fill(55,107,126,190);
        rect(820,710,160,80);
        fill(255);
        textAlign(CENTER);
        textSize(30);
        text("NEXT", 900, 760);
        
        if (mousePressed) {
          current_scene = current_scene.next_scene;
          currentlevel = 1.0;
        }
      }
      else {
        levels_ui();
      }
    }
    else if (current_scene.isD()) {
      
    }
  }
}

void menu_ui() {
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
  text("SPECIAL", width/2, 410);
  
  //prepares the exit button
  stroke(0);
  fill(2,32,53,190);
  rect(width/2-50,500,100,100);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("EXIT", width/2, 560);
}

void special_ui() {
  stroke(0);
  background(bimage);
  fill(51,99,107,127);
  rect(0,0,1000,100);
  rect(0,700,1000,100);
  
  stroke(0);
  fill(2,32,53,190);
  rect(125,125,750,550);
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("Here's a Duck!:", width/2, 180);
  //duck();
  
  fill(2,32,53,190);
  rect(820,710,160,80);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("BACK", 900, 760);
}

//void duck() {
//  //display a duck
//}

void levels_ui() {
  bimage = loadImage(current_scene.background);
  stroke(0);
  background(bimage);
  
  fill(51,99,107,127);
  rect(0,0,1000,100);
  rect(0,700,1000,100);
  
  fill(2,32,53,127);
  rect(0,height/2+100,1000,200);
  rect(20,height/2,200,100,255);
  fill(255);
  textAlign(CENTER);
  text(current_scene.charactername,120,height/2+60);
  
  //display dialogue as evenly as I can.
  for (int i = 0; i < (current_scene.dialogue).size(); i++) {
    fill(255);
    textAlign(CENTER);
    text(current_scene.dialogue.get(i), width/2, height/2+150+(50*i));
  }
  
  if (current_scene.isS()) {
    fill(2,32,53,190);
    rect(20,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("BACK", 100, 760);
    
    fill(2,32,53,190);
    rect(width/2-80,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("MENU", width/2, 760);
    
    fill(2,32,53,190);
    rect(820,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("NEXT", 900, 760);
  }
  else if (current_scene.isD()) {
    fill(2,32,53,190);
    rect(20,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("BACK", 100, 760);
    
    fill(2,32,53,190);
    rect(width/2-80,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("MENU", width/2, 760);
  }
}

//void mousePressed() {
//  println("{"+mouseX+", "+mouseY+"}");
//}
