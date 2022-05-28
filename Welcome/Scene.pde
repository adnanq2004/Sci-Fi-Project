class Scene{
  ArrayList<String> dialogue;
  String background;
  String music;
  boolean loop;
  String charactername;
  boolean isSingle;
  boolean isDouble;
  boolean isEnd;
  public Scene next_scene;
  public Scene last_scene;
  
  Scene(ArrayList<String> d, String b, String m, boolean l, String c, boolean si, boolean di, boolean ei){
    dialogue = d;
    background = b;
    music = m;
    loop = l;
    charactername = c;
    isSingle = si;
    isDouble = di;
    isEnd = ei;
  }
  
  boolean isS() {
    return isSingle;
  }
  boolean isD() {
    return isDouble;
  }
  boolean isE() {
    return isEnd;
  }
}
