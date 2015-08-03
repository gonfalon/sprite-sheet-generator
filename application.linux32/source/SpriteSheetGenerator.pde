import javax.swing.JOptionPane;
import java.io.File;

PImage[] images;
boolean draw;
PImage background;
int imageHeight;

void setup()
{
  background = new PImage();
  String number = JOptionPane.showInputDialog("How many Pictures are there?");
  int imageNumber = Integer.parseInt(number);
  images = new PImage[imageNumber];
  println(imageNumber);
  String h = JOptionPane.showInputDialog("How tall is each picture?");
  imageHeight = Integer.parseInt(h);
  selectFolder("Please Select The Folder: ", "folderSelectCallback");
  frame.setResizable(true);
  size(imageHeight, imageHeight);
  background(255);
  frameRate(60);
  draw = false;
}

int i = 0;
int x = 0;
void draw()
{
if(draw)
  {
      i++;
      if(i == images.length)
      {
        exit();
      }
      int x = 0;
      for(int j = 0; j < i; j++)
      {
        PImage image = images[j];
        image(image, x, 0, image.width, imageHeight);
        x += image.width;
      }

      println(x);
      frame.setSize(x, imageHeight);
      saveFrame("file.png");
    }
}

void folderSelectCallback(File folder)
{
  if (folder == null) {
    println("Window was closed or the user hit cancel.");
    exit();
  } else {
    String path = folder.getAbsolutePath();
    println("User selected " + path);
  
  for(int i = 0; i < images.length; i++)
  {
    images[i] = loadImage(path+File.separator+String.format("%04d", i+1)+".png");
  }
  
  draw = true;
  
  }
}
