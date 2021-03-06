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
