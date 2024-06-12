PImage img;


void setup() {
  size(900, 900);
  img = loadImage("sandbank.png");
  img.resize(900, 900);
}

void draw() {
  background(#f1f1f1);
  int tiles = 10;
  float tileWidth = (float)width / tiles;  // Calculate tile width as float for precise division
  
  genRaster(tiles, tileWidth);
}


void genRaster(int tiles, float tileWidth){
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      float tileCenterX = x * tileWidth + tileWidth / 2;  // Calculate x-coordinate of ellipse center
      float tileCenterY = y * tileWidth + tileWidth / 2;  // Calculate y-coordinate of ellipse center
      
      fill(0);
      float shapeSize = tileWidth/2;
      print(calculateBrightness(tileCenterX, tileCenterY));
      ellipse(tileCenterX, tileCenterY, shapeSize, shapeSize);
      
    }
  }
};

float calculateBrightness(float x, float y) {
  color c = img.get(int(x), int(y));  // Get the color of the pixel at (x, y)
  return brightness(c);               // Calculate and return the brightness of the color
}



void keyPressed() {
  if (key == 's' || key == 'S') {
    String folderPath = "/Users/petzi/Desktop/Uni/HM/4. Semester/GenerativeGestaltung/Projekt/Entstehung/";
    String timestamp = year() + nf(month(), 2) + nf(day(), 2) + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
    String filename = timestamp + "_EVO_Friedrich" + ".jpg";
    String fullPath = folderPath + filename;
    save(fullPath);
  }
}
