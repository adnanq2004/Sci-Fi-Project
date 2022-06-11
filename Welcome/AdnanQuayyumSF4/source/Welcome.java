import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 
import java.io.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Welcome extends PApplet {




double currentlevel;
int timenow;
SoundFile sfile;
PImage bimage;
PImage sprite;
PFont mono;
Scene current_scene;
JSONObject source;
int current_section;
int max_section;

public void setup() {
  
  fill(255);
  rect(-1,-1,1001,801);
  timenow = second();
  //compiles all of the sound files at the very beginning
  File folder = new File(dataPath("music"));
  String[] filenames = folder.list();
  try {
    for (int i = 0; i < filenames.length; i++) {
      sfile = new SoundFile(this, "music/" + filenames[i]);
    }
  }
  catch (Exception e){
    System.out.println("found an excpetion");
  }
  currentlevel = 0.0f;
}

public void draw() {
  if (currentlevel == 0.0f) {
    //begins setting up the menu.
    
    //prepares the soundfile and background image
    sfile = new SoundFile(this, "music/" + "menu.mp3");
    sfile.amp(0.2f);
    bimage = loadImage("backs/__space.jpg");
    
    //plays the soundfile
    sfile.play();
    sfile.loop();
    
    currentlevel = 0.1f;
  }
  else if (currentlevel == 0.1f) {
    menu_ui();
    
    currentlevel = 0.2f;
  }
  else if (currentlevel == 0.2f) {
    menu_hover_ui();
  }
  else if (currentlevel == 0.3f) {
    special_ui();
    
    currentlevel = 0.4f;
  }
  else if (currentlevel == 0.4f) {
    special_hover_ui();
  }
  else if (currentlevel == 1.0f) {
    levels_startup();
    
    currentlevel = 1.1f;
  }
  else if (currentlevel == 1.1f) {
    levels_ui();
    currentlevel = 1.2f;
  }
  else if (currentlevel == 1.2f) {
    levels_hover_ui();
  }
}

public void menu_ui() {
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

public void menu_hover_ui() {
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
  }
  //check if mouse hovering over special button
  else if (mouseX > 420 && mouseX < 580 && mouseY < 450 && mouseY > 350) {
    //change the endings button to show it is being hovered over.
    stroke(255);
    fill(55,107,126,190);
    rect(width/2-80,350,160,100);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("SPECIAL", width/2, 410);
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
  }
  else {
    menu_ui();
  }
}

public void special_ui() {
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
  text("Here's a picture of a duck!", width/2, 180);
  duck();
  
  fill(2,32,53,190);
  rect(820,710,160,80);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("BACK", 900, 760);
}

public void duck() {
  //display a duck
  PImage img = loadImage("duck.jpg");
  tint(255);
  image(img, 150, 200, 700, 450);
}

public void special_hover_ui() {
  if (mouseX > 820 && mouseX < 980 && mouseY > 710 && mouseY < 790) {
    stroke(255);
    fill(55,107,126,190);
    rect(820,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("BACK", 900, 760);
    
  }
  else {
    special_ui();
  }
}

public void levels_startup() {
  max_section = current_scene.characters.size();
  if (current_scene.music.get(current_section).get(0).equals("stop")) {
    if (sfile.isPlaying()) {
      sfile.stop();
    }
  }
  else {
    if (!(current_scene.music.get(current_section).get(0).equals("none"))) {
      sfile = new SoundFile(this, "music/" + current_scene.music.get(current_section).get(0));
        sfile.amp(0.2f);
      sfile.play();
      if (current_scene.music.get(current_section).size() > 1 && current_scene.music.get(current_section).get(1).equals("l")) {
        sfile.loop();
      }
    }
  }
}

public void levels_ui() {
  bimage = loadImage("backs/"+current_scene.background);
  stroke(0);
  background(bimage);
  fill(51,99,107,127);
  rect(0,0,1000,100);
  rect(0,700,1000,100);
  
  fill(2,32,53,127);
  rect(0,height/2+100,1000,200);
  rect(20,height/2,200,100,255);
  
  //display dialogue as evenly as I can.
  for (int i = 0; i < (current_scene.dialogue.get(current_section)).size(); i++) {
    fill(255);
    textAlign(CENTER);
    text(current_scene.dialogue.get(current_section).get(i), width/2, height/2+160+(50*i));
  }
  //display character name
  fill(255);
  textAlign(CENTER);
  text(current_scene.characters.get(current_section),120,height/2+60);
  
  //display sprite.
  if (!current_scene.sprites.get(current_section).equals("none")) {
    sprite = loadImage("sprites/"+current_scene.sprites.get(current_section));
    tint(255);
    image(sprite,230,height/2-100,200,200);
  }
  
  if (!(current_section == max_section-1)) {
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
  else {
    if (current_scene.endings.size() > 0) {
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
      rect(20,10,400,80);
      fill(255);
      textAlign(CENTER);
      textSize(30);
        text(current_scene.endings.get(0).get(1), 220, 60);
      
      if (current_scene.endings.size() > 1) {
        fill(2,32,53,190);
        rect(580,10,400,80);
        fill(255);
        textAlign(CENTER);
        textSize(30);
        text(current_scene.endings.get(1).get(1), 780, 60);
      }
    }
    else {
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
}

public void levels_hover_ui() {
  //check if hovering over back
  if (mouseX > 20 && mouseX < 180 && mouseY > 710 && mouseY < 790) {
    stroke(255);
    fill(55,107,126,190);
    rect(20,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("BACK", 100, 760);
      
  }
  //check if hovering over menu
  else if (mouseX>width/2-80 && mouseX < width/2+80 && mouseY > 710 && mouseY < 790) {
    stroke(255);
    fill(55,107,126,190);
    rect(width/2-80,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("MENU", width/2, 760);
    
  }
  //check if hovering over next
  else if (mouseX > 820 && mouseX < 980 && mouseY > 710 && mouseY < 790 && !(current_section == max_section-1)) {
    stroke(255);
    fill(55,107,126,190);
    rect(820,710,160,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("NEXT", 900, 760);
  }
  //check if hovering over option1
  else if (mouseX > 20 && mouseX < 420 && mouseY > 10 && mouseY < 90 && (current_scene.endings.size() > 0)  && (current_section == max_section-1)) {
    stroke(255);
    fill(55,107,126,190);
    rect(20,10,400,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(current_scene.endings.get(0).get(1), 220, 60);
    
  }
  //check if hovering over option2
  else if (mouseX > 580 && mouseX < 980 && mouseY > 10 && mouseY < 90 && (current_scene.endings.size() > 1) && (current_section == max_section-1)) {
    stroke(255);
    fill(55,107,126,190);
    rect(580,10,400,80);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(current_scene.endings.get(1).get(1), 780, 60);
    
  }
  else {
    levels_ui();
  }
}

public void mouseClicked() {
  //if mousepressed during menu_hover
  if (currentlevel == 0.2f) {
    if (mouseX > 450 && mouseX < 550 && mouseY < 300 && mouseY > 200) {
      if (sfile.isPlaying()) {
        sfile.stop();
      }
      currentlevel = 1.0f;
      current_section = 0;  
      source = loadJSONObject("empire9.json");
      current_scene = new Scene(source);
    }
    else if (mouseX > 420 && mouseX < 580 && mouseY < 450 && mouseY > 350) {
      currentlevel = 0.3f;
    }
    else if (mouseX > 450 && mouseX < 550 && mouseY < 600 && mouseY > 500) {
      exit();
    }
  }
  //if mousepressed during special_hover
  if (currentlevel == 0.4f) {
    if (mouseX > 820 && mouseX < 980 && mouseY > 710 && mouseY < 790) {
      currentlevel = 0.1f;
    }
  }
  //if mousepressed during level_hover
  if (currentlevel == 1.2f) {
    //back button
    if (mouseX > 20 && mouseX < 180 && mouseY > 710 && mouseY < 790) {
      if (current_section > 0) {
        current_section -= 1;
        currentlevel = 1.0f;
      }
    }
    //menu button
    else if (mouseX>width/2-80 && mouseX < width/2+80 && mouseY > 710 && mouseY < 790) {
      if (sfile.isPlaying()) {
        sfile.stop();
      }
      currentlevel = 0.0f;
    }
    //next button
    else if (mouseX > 820 && mouseX < 980 && mouseY > 710 && mouseY < 790 && !(current_section == max_section-1)) {
      current_section += 1;
      currentlevel = 1.0f;
    }
    //choice 1
    else if (mouseX > 20 && mouseX < 420 && mouseY > 10 && mouseY < 90 && (current_scene.endings.size() > 0) && (current_section == max_section-1)) {
      source = loadJSONObject(current_scene.endings.get(0).get(0));
      current_section = 0;
      currentlevel = 1.0f;
      current_scene = new Scene(source);
      if (sfile.isPlaying()) {
        sfile.stop();
      }
    }
    //choice 2
    else if (mouseX > 580 && mouseX < 980 && mouseY > 10 && mouseY < 90 && (current_scene.endings.size() > 1) && (current_section == max_section-1)) {
      source = loadJSONObject(current_scene.endings.get(1).get(0));
      current_section = 0;
      currentlevel = 1.0f;
      current_scene = new Scene(source);
      if (sfile.isPlaying()) {
        sfile.stop();
      }
    }
  }
}
class Scene{
  
  ArrayList<ArrayList<String>> dialogue = new ArrayList<ArrayList<String>>();
  String background;
  ArrayList<String> characters = new ArrayList<String>();
  ArrayList<String> sprites = new ArrayList<String>();
  ArrayList<ArrayList<String>> music = new ArrayList<ArrayList<String>>();
  ArrayList<ArrayList<String>> endings = new ArrayList<ArrayList<String>>();
  
  Scene(JSONObject json) {
    JSONArray dialogue_array = json.getJSONArray("dialogue");
    for (int i = 0; i < dialogue_array.size(); i++) {
      dialogue.add(new ArrayList<String>());
      for (int j = 0; j < dialogue_array.getJSONArray(i).size(); j++) {
        dialogue.get(i).add(dialogue_array.getJSONArray(i).getString(j));
      }
    }
    background = json.getString("background");
    JSONArray character_array = json.getJSONArray("character");
    for (int i = 0; i < character_array.size(); i++) {
      characters.add(character_array.getString(i));
    }
    JSONArray sprite_array = json.getJSONArray("sprite");
    for (int i = 0; i < sprite_array.size(); i++) {
      sprites.add(sprite_array.getString(i));
    }
    JSONArray music_array = json.getJSONArray("music");
    for (int i = 0; i < music_array.size(); i++) {
      music.add(new ArrayList<String>());
      for (int j = 0; j < music_array.getJSONArray(i).size(); j++) {
        music.get(i).add(music_array.getJSONArray(i).getString(j));
      }
    }
    JSONArray ending_array = json.getJSONArray("endings");
    for (int i = 0; i < ending_array.size(); i++) {
      endings.add(new ArrayList<String>());
      for (int j = 0; j < ending_array.getJSONArray(i).size(); j++) {
        endings.get(i).add(ending_array.getJSONArray(i).getString(j));
      }
    }
  }
  
}
  public void settings() {  size(1000, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Welcome" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
