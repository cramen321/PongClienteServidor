import netP5.*;
import oscP5.*;
import processing.serial.*;

OscP5 cliente2;
NetAddress dirIp2;

Serial port;

String sensores;
int potenciometro1;

int posi;

void setup()
{
 size(400,400);
 port= new Serial(this, Serial.list()[0],9600);
 //se deja igual que el servidor
 cliente2 = new OscP5(this,10000);
 //"localhost" para conectarlo con mi propio computador
 dirIp2 = new NetAddress("localhost",10000);
}
void draw(){
 background(255);
if(0<port.available())
 {
  sensores = port.readStringUntil('\n');
   //String[] datosSensor = split(sensores,'T');
   if(sensores != null){  
      potenciometro1 = int(trim(sensores));     
      OscMessage miMns2= new OscMessage("/test1");
      posi = (int)map(potenciometro1,0,255,300,560);
      miMns2.add(posi);
      cliente2.send(miMns2,dirIp2);
          println(posi);  
      }
   }
//envìa informaciòn mientras se mueve el mouse
//void mouseMoved(){
 //OscMessage miMns= new OscMessage("/test1");
 //miMns.add(mouseX);
 //miMns.add(mouseY);
 //cliente2.send(miMns,dirIp2);
}
