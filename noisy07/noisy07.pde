int l = 3000;
float x, y, z, r, ra, rb;
float nx, ny, nz;

void setup() {
  size(1400, 800);
  frameRate(60);
  smooth();
  background(0);
}

void draw() {
  noFill();
  x=random(width);
  y=random(height);
  z=random(width);
  r=random(1, 30);
  ra=noise(z*3, x*3, y*5)*10;
  rb=noise(x*8, y*3, z*5)*20;
  
  beginShape();
  for (int i=0; i<l; i++) {
    stroke(255, random(70, 100));
    strokeWeight(random(0.1, 1));
    x+=noise(x*0.005, y*0.003, z*0.008)*10-5;
    y+=noise(y*0.005, z*0.005, x*0.007)*10-5;
    z+=noise(z*0.003, x*0.003, y*0.005)*10-5;

    nx=x;
    ny=y;
    nz=z;

    line(x, y, nx, ny);

    if (random(100)>80) {
      strokeWeight(random(0.5, 1));
      //point(nx+random(-2, 2), ny+random(-2, 2));
    }
    if (random(100)>90) {
      strokeWeight(random(0.1, 0.5));
      //point(nx+random(-5, 5), ny+random(-5, 5));
    }
    if (random(100)>99.9) {
      noFill();
      stroke(255);
      strokeWeight(random(0.1, 1));
      ellipse(nx+r*cos(radians(random(360))), ny+r*sin(radians(random(360))), ra, ra);
    }
    if (random(100)>99.93) {
      fill(255);
      ellipse(nx, ny, rb, rb);
    }
  }
  endShape();
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "hoge.png" );
  }
}