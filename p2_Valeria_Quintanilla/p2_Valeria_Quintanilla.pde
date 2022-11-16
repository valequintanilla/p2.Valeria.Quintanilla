import processing.video.*;
//Buttons
Button SocialFeed;
Button NewsFeed;
Button HealthButton;
Button Calendar;
Button addEvent;
Button backButton;
//Health buttons
Button sleep;
Button workout;
Button mirrorTime;
Button change;
//Clocks
Clock digitalClock;
Clock smallClock;
Capture cam;

Calendar calendarMonth;
NewsFeed newsFeed;
SocialFeed social;

color lighton = color(240,240,240);
boolean currentlyOnMainScreen = true;
boolean NewsScreen, CalendarScreen, SocialFeedScreen , HealthScreen, back = false;
PImage health;
PImage cal;
PImage newslogo;
PImage sleepLogo;
PImage workoutLogo;
void setup() {
  size(700,700);
  smooth();
  
  //Costruct Buttons for Main Screen
  SocialFeed = new Button(620,90,90,60, "Notifications", 130, 178, 216);
  NewsFeed = new Button(90,620,80,60, "News", 232, 75, 196);
  HealthButton = new Button(620,550,80,60, "Health", 232, 75, 196);
  Calendar = new Button(620,620,80,60, "Calendar", 232, 75, 196);
  //additional buttons
  addEvent = new Button(620,90,80,60, "Add Event", 130, 178, 216);
  backButton = new Button(620,150,80,60, "Back", 130, 178, 216);
  workout = new Button(620,90,80,60, "\nWorkouts\n", 130, 178, 216);
  sleep = new Button(90,150,80,60, "Sleep info", 130, 178, 216);
  mirrorTime = new Button(620,620,80,60, "Mirror Time:\n 3hrs", 130, 178, 216);
  change = new Button(90,620,80,60, "change", 130, 178, 216);
  //camera
  cam = new Capture(this,700,700,30);
  cam.start();
  
  //Clock
  digitalClock = new Clock(70, width/2, 100);
  smallClock = new Clock(10,620,50);
  
  //Different Screens
  calendarMonth = new Calendar(40,40, width/2, 100);
  newsFeed = new NewsFeed(40,40, width/2, 100);
  social = new SocialFeed(40,40, width/2, 100);
  
  //Images
  health = loadImage("healthButton.png");
  cal = loadImage("cal.png");
  newslogo = loadImage("newslogo.png");
  workoutLogo = loadImage("workoutLogo.png");
  sleepLogo = loadImage("sleepLogo.png");
}


void draw() {
  if(cam.available()){
    cam.read();
  }
 background(150);
 image(cam, 0, 0);
 //fill(0);

 if(currentlyOnMainScreen == true ){
  
   SocialFeed.update();
   SocialFeed.render();
   
   NewsFeed.update();
   NewsFeed.displayImage(newslogo,50,585);
   
   HealthButton.update();
   HealthButton.displayImage(health, 580,525);
   
   Calendar.update();
   Calendar.displayImage(cal, 580,585);
   
   backButton.update();
   textSize(70);
   digitalClock.getTime();
   digitalClock.display();
   
   checkClicked();
   }else{
   //if currentlyOnFirstScren is not true, then we must be currently on the second screen, so
//this is where we put the things on the second sreen

    if(SocialFeedScreen == true){
      smallClock.getTime();
      textSize(20);
      smallClock.display();
      text("Social Feed",100,60);
      textSize(30);
      social.showNotifications();
      social.showtexts();
      backButton.update();
      
      backButton.render();
      
    }
    if(NewsScreen == true){
      smallClock.getTime();
      textSize(20);
      smallClock.display();
      text("News Feed",100,60);
      textSize(30);
      newsFeed.showNews();
      newsFeed.showWeather();
      backButton.render();
      backButton.update();
      
    }
    if(HealthScreen == true){
      smallClock.getTime();
      textSize(20);
      smallClock.display();
      text("Health",100,60);
      textSize(30);
      backButton.render();
      backButton.update();
      workout.displayImage(workoutLogo, 580, 60);
      sleep.displayImage(sleepLogo, 50, 95);
      mirrorTime.render();
      change.render();
      text("Current weight:\n 120lbs", 90, 500);
      textSize(70);
      
      
     
    }
    if(CalendarScreen == true){
      smallClock.getTime();
      textSize(20);
      smallClock.display();
      textSize(40);
      text("Calendar",100,60);
      
      
      String t = calendarMonth.getDate();
      textSize(30);
      text("Today : " + t, 350, 100);
      
      calendarMonth.showCalendar();
      addEvent.render();
      backButton.render();
      backButton.update();
     
    }
    checkClicked();

   }
   
}

void checkClicked(){
  if(SocialFeed.isClicked()){
    SocialFeed.ButtonColor = (lighton);
    currentlyOnMainScreen = false;// button turns yellow when clicked
    SocialFeedScreen = true;
    NewsScreen = false;
    CalendarScreen = false;
    HealthScreen = false;
    back = false;
  }
  
  //News Feed Button is clicked then the button will change color
   if(NewsFeed.isClicked()){
    NewsFeed.ButtonColor = (lighton);// button turns yellow when clicked
    currentlyOnMainScreen = false;
    NewsScreen = true;
    SocialFeedScreen = false;
    CalendarScreen = false;
    HealthScreen = false;
    back = false;
  }
  
  //Health button is clicked then the button will change color
   if(HealthButton.isClicked()){
    HealthButton.ButtonColor = (lighton);// button turns yellow when clicked
    currentlyOnMainScreen = false;
    HealthScreen = true;
    NewsScreen = false;
    SocialFeedScreen = false;
    CalendarScreen = false;
    back = false;
  }
  //Calendar button is clicked then the button will change color
   if(Calendar.isClicked()){
    Calendar.ButtonColor = (lighton);// button turns yellow when clicked
    currentlyOnMainScreen = false;
    CalendarScreen = true;
    HealthScreen = false;
    NewsScreen = false;
    SocialFeedScreen = false;
    back = false;
  }
  if(backButton.isClicked()){
    backButton.ButtonColor = (lighton);// button turns yellow when clicked
    currentlyOnMainScreen = true;
    CalendarScreen = false;
    HealthScreen = false;
    NewsScreen = false;
    SocialFeedScreen = false;
    back = false;
  }
}
