class Scene{
  String dialogue;
  String background;
  String music;
  String charactername;
  boolean isSingle;
  boolean isDouble;
  boolean isEnd;
  
  Scene(String d, String b, String m, String c, boolean si, boolean di, boolean ei){
    dialogue = d;
    background = b;
    music = m;
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
