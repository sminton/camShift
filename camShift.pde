// use an input device to shift camera position
// enhance: use kinect head position

float ex = 0.0;
float ey = 0.0;
float ez = 50.0;

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background( 128 );

  getEyeFromMouse( 0.05 ); // sets ex, ey based on mouse
  //getEyeFromKinect(); // set the ex, ey and ez based on head pos

  camera(ex, ey, ez, ex, ey, ez-50, 0.0, 1.0, 0.0);
  drawScene();
}

void getEyeFromMouse( float strength )
{
    int cx = width/2;
    int cy = height/2;
    float offsetx = (float)(mouseX - cx);
    float offsety = (float)(mouseY - cy);
    ex = offsetx * strength;
    ey = offsety * strength;
}

void drawScene()
{
  for (float x = -70; x<=70; x+=20 )
  {
    for (float y = -50; y<=50; y+=20 )
    {
      for (float z = -100; z<=-10; z+=20 )
      {
        pushMatrix();
          translate( x, y, z );
          box( 10 );
         popMatrix();
      }
    }
  }
}

