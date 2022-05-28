class Double extends Scene{
  String top_text;
  Scene top_next;
  String bot_text;
  Scene bot_next;
  Double(ArrayList<String> d, String b, String m, boolean l, String c, Scene tn, Scene bn, String tt, String bt) {
    super(d,b,m,l,c,true,false,false);
    top_next = tn;
    bot_next = bn;
    top_text = tt;
    bot_text = bt;
  }
}
