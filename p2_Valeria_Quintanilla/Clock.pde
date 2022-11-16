class Clock{
  int fontSize;
  float x, y;
  
  //costructor
  Clock(int font, float x1, float y1){
    fontSize = font;
    x = x1;
    y = y1;
  }
   int h,m,s;
   Clock(){
   }
  void getTime(){
    h = hour();
    m = minute();
    s = second();
  }
  void display(){
    //textSize(70);
    //textAlign(50,50);
    text(h + ":" + nf(m,2)+ ":" + nf(s,2) , x, y);
    
  }
}
