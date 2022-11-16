class NewsFeed{
  PVector Pos = new PVector(0,0); // position 
  float Width = 0; //width of button
  float Height = 0; //height of button
  int monthNum, day, year;
  PImage news;
  PImage weather;
  
  NewsFeed(int x, int y, int w, int h){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    
  }
  void showNews(){
    //textSize(70);
    
    //text(monthNum + "," + nf(day,2)+ "," + nf(year,2) , Pos.x, Pos.y);
    news = loadImage("news.png");
    tint(255,200);
    image(news,70, 70, 400, 400 );
    
  }
  void showWeather(){
    weather  = loadImage("weather.png");
    tint(255,250);
    image(weather, 70, 500 , 300, 150 );
  }

}
