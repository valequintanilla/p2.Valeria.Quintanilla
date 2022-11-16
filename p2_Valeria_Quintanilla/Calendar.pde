
class Calendar{
  String[] monthNames = {"January","Februrary","March","April","June","July","August","Septemeber","October","November","December"};
  String[] weekDays = {"Sunday","Monday","Tuesday","Wednesday", "Thursday","Friday","Saturday"};
  int[] monthDays = {30, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  PVector Pos = new PVector(0,0); // position 
  float Width = 0; //width of button
  float Height = 0; //height of button
  int monthNum, day, year;
  PImage nov;
  
  Calendar(int x, int y, int w, int h){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    
  }
  String getDate(){
    monthNum = month();
    day = day();
    year = year();
    return (monthNum + ", " + day + ", " + year);
  }
  void showCalendar(){
    //textSize(70);
    
    //text(monthNum + "," + nf(day,2)+ "," + nf(year,2) , Pos.x, Pos.y);
    nov = loadImage("Nov-2022.png");
    tint(255,150);
    image(nov,150, 150, 400, 400 );
    
  }
  
}
