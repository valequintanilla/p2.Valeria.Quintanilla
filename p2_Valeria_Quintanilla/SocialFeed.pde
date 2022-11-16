class SocialFeed{
  PVector Pos = new PVector(0,0); // position 
  float Width = 0; //width of button
  float Height = 0; //height of button
  int monthNum, day, year;
  PImage notifications;
  PImage texts;
  
  SocialFeed(int x, int y, int w, int h){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    
  }
  void showNotifications(){
    //textSize(70);
    
    //text(monthNum + "," + nf(day,2)+ "," + nf(year,2) , Pos.x, Pos.y);
    notifications = loadImage("notifications.png");
    tint(255,250);
    image(notifications,70, 70, 250, 250 );
    
  }
  void showtexts(){
    texts  = loadImage("texts.png");
    tint(255,250);
    image(texts, 70, 320 , 250, 250 );
  }

  
}
