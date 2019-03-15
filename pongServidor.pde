import netP5.*;
import oscP5.*;

//ancho y alto
int ancho=20;
int alto=35;

//posición en X del cuadradito
int temp;
int temp1;
int temp2;
int temp3;

//ubicacion del cuadradito
int ubicY1;
int ubicY2;
int ubicY3;
int ubicY4;

//ubicacion de la bola
float x=150;
float y=30;

//dirección para el rebote de la bola
int dir=1;
int dir2=1;

int vel = -5;

OscP5 servidor;
//NetAddress myDir;

void setup(){
size(600,600);
servidor = new OscP5(this,10000);
}
void draw()
{
  //cuadrado 1
 background(0);
 ubicY1= temp+(alto/2);
 fill(255);
 rect(10,temp,ancho,alto);
 
 //cuadrado2
 ubicY2= temp1+(alto/2);
 fill(20,20,150);
 rect(10,temp1,ancho,alto);
 
   //cuadrado 3
 ubicY3= temp2+(alto/2);
 fill(200,50,50);
 rect(580,temp2,ancho,alto);
 
 //cuadrado4
 temp3 = ubicY4+(alto/2);
 fill(20,200,50);
 rect(580,temp3,ancho,alto);
 
 //bola
  stroke(255);
  fill(255);
  ellipse(x,y,15,15);
  
  //velocidad de la bola
  x=x+vel*dir;
  y=y+vel*dir2; 
  
   //si la bola se sale de la pantalla por la pared derecha, vuelva y aparesca desde la pared izkierda
  if(x>1024)  
  {
    x= width/2;    
    y = random (0,400);
  }
  
  //si la bola pega contra la pared de arriba o de abajo rebota es decir cambia de dirección
  if((y>600)||(y<0))
  {
    dir2=dir2*-1;
  }

  //si la bola se sale de la pantalla por la pared izkierda, vuelva y aparesca desde la pared derecha
  if(x<0)
  {
    x= width/2;    
    y = random (0,400);
  }
   //REBOTA SI LA PELOTA ESTA CERCA DEL MURO IZQUIERDO
  if(x > 0 && x <= ancho+20)
  {
    //REBOTA SI LA PELOTA ESTA CERCA DEL JUGADOR   
    //if(y >= posicionY1-(alto/2) && y <= posicionY1+(alto/2) )
    if(y >= ubicY1-alto && y <= ubicY1+alto )
    {
      dir *= -1;
    }
    else if(y >= ubicY2-alto && y <= ubicY2+alto )
    {
      dir *= -1;
    }
  }
  
  //REBOTA SI LA PELOTA ESTA CERCA DEL MURO DERECHO
  if(x <= width && x >= width-ancho-20)
  {
    //REBOTA SI LA PELOTA ESTA CERCA DEL JUGADOR   
    //if(y >= posicionY1-(alto/2) && y <= posicionY1+(alto/2) )
    if(y >= ubicY4-alto && y <= ubicY4+alto )
    {
      dir *= -1;
    }
    else if(y >= ubicY3-alto && y <= ubicY3+alto )
    {
      dir *= -1;
    }
  }

}
//para recibir mensajes
void oscEvent(OscMessage oscmsn){
  //seguridad
  if(oscmsn.checkAddrPattern("/test")==true){
    temp = oscmsn.get(0).intValue();
    println(temp);
    //temp1 = oscmsn.get(1).intValue();
  }
  if(oscmsn.checkAddrPattern("/test1")==true){
    temp1 = oscmsn.get(0).intValue();
  }
  if(oscmsn.checkAddrPattern("/test2")==true){
    temp2 = oscmsn.get(0).intValue();
  }
  if(oscmsn.checkAddrPattern("/test3")==true){
    temp3 = oscmsn.get(0).intValue();
    
  }
  //con esta funcion se retorna el nombre que vamos a recibir por parte del cliente
  println(oscmsn.addrPattern());
}
