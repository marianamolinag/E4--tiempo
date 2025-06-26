//Mariana Molina 202222414
//E4: Tiempo
//Pasar el mouse por encima de la luces, para ver claramenre la hora, el minuto o el segundo cuando la bombilla se encienda
//luz roja= horas luz amarilla= minutos luez verde = segundos 
int h;
int m;
int s;

String timeString;

//dimensiones del semaforo en variables
int centroX, centroY;
int anchoSemaforo = 350;
int altoSemaforo = 600;
int radioLuz = 120;

//tipografia que se asimile a la de un computador 
PFont fontDigital;

//tamaño del lienzo y ubicacion de posiciones en x y y 
void setup() {
  size(800, 800);
  centroX = width / 2;
  centroY = height / 2;
  
  // Fuente tipo digital
  fontDigital = createFont("Courier", 32);
  textFont(fontDigital);
}

void draw() {
  background(0);
  
  // Hora actual
  h = hour();
  m = minute();
  s = second();

   
  //coordenadas que representaran el cenrtro de la figura
  rectMode(CENTER);
  
    // Poste
  fill(80);
  rect(centroX, centroY + altoSemaforo / 2 + 100, 40, 200);
  
  // Borde negro del semáforo
  stroke(0);
  strokeWeight(8);
  fill(255, 200, 0); 
  rect(centroX, centroY, anchoSemaforo, altoSemaforo, 20);
  
  // Separadores entre luces
  stroke(0);
  strokeWeight(4);
  line(centroX - anchoSemaforo / 2, centroY - altoSemaforo / 6, centroX + anchoSemaforo / 2, centroY - altoSemaforo / 6);
  line(centroX - anchoSemaforo / 2, centroY + altoSemaforo / 6, centroX + anchoSemaforo / 2, centroY + altoSemaforo / 6);
  
  // Tornillos 
  fill(50);
  noStroke();
  ellipse(centroX - anchoSemaforo / 2 + 15, centroY - altoSemaforo / 2 + 15, 12, 12);
  ellipse(centroX + anchoSemaforo / 2 - 15, centroY - altoSemaforo / 2 + 15, 12, 12);
  ellipse(centroX - anchoSemaforo / 2 + 15, centroY + altoSemaforo / 2 - 15, 12, 12);
  ellipse(centroX + anchoSemaforo / 2 - 15, centroY + altoSemaforo / 2 - 15, 12, 12);
  
  
  // Posiciones de las luces semaforo
  float luzRojaY = centroY - altoSemaforo / 3;
  float luzAmarillaY = centroY;
  float luzVerdeY = centroY + altoSemaforo / 3;
  
  noStroke();
  
  // luz roja
  if (mouseDentro(centroX, luzRojaY, radioLuz)) {
    //encendido
    fill(255, 100, 100); 
  } else {
    //apagado
    fill(150, 0, 0); 
  }
  ellipse(centroX, luzRojaY, radioLuz, radioLuz);
  
  //luz amarilla
  if (mouseDentro(centroX, luzAmarillaY, radioLuz)) {
    //encendido
    fill(255, 255, 150); 
  } else {
    //apagado
    fill(150, 150, 0); 
  }
  ellipse(centroX, luzAmarillaY, radioLuz, radioLuz);
  
  // luz verde
  if (mouseDentro(centroX, luzVerdeY, radioLuz)) {
    //encendido
    fill(100, 255, 100);
  } else {
    //apagado
    fill(0, 150, 0); 
  }
  ellipse(centroX, luzVerdeY, radioLuz, radioLuz);
  
  // numeros denrtro de las luces del semaforo
  textAlign(CENTER, CENTER);
  textSize(32);
  
  // Hora
  //si el mouse pasa encima de la linea roja
  if (mouseDentro(centroX, luzRojaY, radioLuz)) {
    //true==se vuelve blanco
    fill(255);
    //false==el color de relleno vuelve a ser rojo
  } else {
    fill(100, 0, 0);
  }
  //se dibuja h == horas encima de la luz roja
  //number format
  //h=hora 2=numero minimo de digitos a mostrar
  text(nf(h, 2), centroX, luzRojaY);
  
  // Minutos
  if (mouseDentro(centroX, luzAmarillaY, radioLuz)) {
    fill(255);
  } else {
    fill(100, 100, 0);
  }
  text(nf(m, 2), centroX, luzAmarillaY);
  
  // Segundos
  if (mouseDentro(centroX, luzVerdeY, radioLuz)) {
    fill(255);
  } else {
    fill(0, 100, 0);
  }
   text(nf(s, 2), centroX, luzVerdeY);

}

// verificar si el mouse esta dentro de la luz
//x, y, radio
boolean mouseDentro(float cx, float cy, float r) {
  float d = dist(mouseX, mouseY, cx, cy);
  //Si la distancia d es menor que la mitad del diámetro (r/2) el mouse está dentro del círculo de la luz
  return d < r / 2;
}
