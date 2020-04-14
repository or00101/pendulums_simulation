int n = 7; //number of pendulums.
float m = 20; //all bobs have the same mass.

int[] bob_color = new int[n];
float[] r = new float[n];
float[] a = new float[n];
float[] a_v = new float[n];
float[] a_a = new float[n];

float g = 1; //free fall acc.

void setup(){
  size(600,600);
  
  set_start(a, 0.3, n); //setting starting angle.
  set_start(a_v, 0, n); //setting starting angular velocity.
  set_start(a_a, 0, n); //assigning numbers to the angular acceleratoin array.
  
  set_bob_color();
  set_length(100, 550);
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(2);
  
  //make point 0,0 at the middle top
  translate(width/2, height/12);
  
  for (int i = 0; i < n; i++)
  {
    strokeWeight(0.4);
    
    float xi = r[i] * sin(a[i]);
    float yi = r[i] * cos(a[i]);
    line(0, 0, xi, yi);
    fill(bob_color[i]);
    ellipse(xi, yi, m, m);
    
    a_a[i] = -g/r[i] * a[i];
    a_v[i] += a_a[i] * 2;
    //a_v[i] *= 0.995; //friction.
    a[i] += a_v[i];
  }
  
  // Add delay on first frame (showing release angle more clearly).
  if (frameCount == 2)
    delay(200);
}

void set_start(float[] arr, float elem, int n){
  for (int i = 0; i<n; i++)
    arr[i] = elem;
}

void set_bob_color(){
  int inc = 255/n;
  
  for (int i = 0; i < n; i++)
    bob_color[n-i-1] = inc * i;
}

void set_length(float s, float f){
  float inc = (f - s)/n;
  
  for (int i = 0; i < n; i ++)
    r[i] = s + inc * i;
}
