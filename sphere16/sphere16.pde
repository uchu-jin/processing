int num = 1000;
int r=260;
float[] xPos = new float[num];
float[] yPos = new float[num];
float[] zPos = new float[num];
float[] nxPos = new float[num];
float[] nyPos = new float[num];
float[] nzPos = new float[num];

float[] radianS = new float[num];
float[] radianT = new float[num];
float[] radianU = new float[num];
float[] radianV = new float[num];

float[] radianSr = new float[num];
float[] radianTr = new float[num];
float[] lineRadRam = new float[num];

float[] swDiff = new float[num];
float sw;

import gifAnimation.*;
import processing.opengl.*;
GifMaker gifExport; // objet pour l'enregistrement et l'export de gif

void setup() {
  size(720, 720, P3D);

  for (int i = 0; i < num; i++) {
    radianS[i] = radians(random(360));
    radianT[i] = radians(random(360));
    radianU[i] = radians(random(360));
    radianV[i] = radians(random(360));
    radianSr[i] = radians(random(-0.3, 0.3));
    radianTr[i] = radians(random(-0.3, 0.3));
    swDiff[i] = random(0.005, 1);
    lineRadRam[i] = radians(random(360));
  }
  //gifExport = new GifMaker(this, "mongif.gif", 30); // instanciation de l'objet gif
  //gifExport.setRepeat(0); // 0 pour une animation qui tourne en boucle, 1 pour le contraire
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  noStroke();
  fill(0);
  sphere(150);
  rotateZ(-0.5);
  rotateY(-frameCount*0.003);

  for (int i = 0; i < num; i++) {
    stroke(255);
    sw+=swDiff[i]*0.01;
    strokeWeight(sin(radians(sw+lineRadRam[i]))*swDiff[i]*10);

    radianS[i]+=radianSr[i];
    radianT[i]+=radianTr[i];
    xPos[i] = r * sin(radianS[i]) * cos(radianT[i]);
    yPos[i] = r * sin(radianS[i]) * sin(radianT[i]);
    zPos[i] = r * cos(radianS[i]);

    nxPos[i] = r * sin(radianU[i]) * cos(radianV[i]);
    nyPos[i] = r * sin(radianU[i]) * sin(radianV[i]);
    nzPos[i] = r * cos(radianU[i]);

    point(xPos[i], yPos[i], zPos[i]);

    strokeWeight(sin(radians(lineRadRam[i]))*5);
    line(xPos[i], yPos[i], zPos[i], nxPos[i], nyPos[i], nzPos[i]);
  }
  //gifExport.setDelay(30); // temps en milisecondes entre chaque frame du gif. mettre 1 par defaut
  //gifExport.addFrame(); // ajout de la frame au gif
  //saveFrame("/Users/mdm/Desktop/frames/####.png");
  println(frameCount);
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "hoge.png" );
  }
}