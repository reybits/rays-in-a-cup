float radius = 240.0f;
float cx, cy;
int segments = 200;
float multiplier = 2;

void setup()
{
  size(640, 480);
  strokeWeight(1);
  frameRate(30);

  cx = width * 0.5f;
  cy = height * 0.5f;
}

void draw()
{ 
  background(0);

  drawCircle();
  drawLines();

  float dt = getDelta();
  multiplier += dt * 0.5f;
}

float lastTime = millis();
float getDelta()
{
  float now = millis();
  float dt = now - lastTime;
  lastTime = now;
  return dt / 1000.0f;
}

void drawCircle()
{
  noFill();
  stroke(0,255,0);
  beginShape();
  float delta = TWO_PI / segments;
  for (int i = 0; i < segments; i++)
  {
      float x = cx + cos(i * delta) * radius;
      float y = cy + sin(i * delta) * radius;
      vertex(x, y);

  }
  endShape(CLOSE);
}

void drawLines()
{
  noFill();
  stroke(155,155,155);
  beginShape(LINES);
  float delta = TWO_PI / segments;
  for (int i = 0; i < segments; i++)
  {
      int idx0 = i % segments;
      float x0 = cx + cos(idx0 * delta) * radius;
      float y0 = cy + sin(idx0 * delta) * radius;
      vertex(x0, y0);

      int idx1 = int(i * multiplier) % segments;
      float x1 = cx + cos(idx1 * delta) * radius;
      float y1 = cy + sin(idx1 * delta) * radius;
      vertex(x1, y1);

  }
  endShape();
}
