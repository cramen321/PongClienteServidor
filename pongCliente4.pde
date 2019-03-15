import netP5.*;
import oscP5.*;
import processing.serial.*;

OscP5 cliente4;
NetAddress dirIp4;

Serial port;

String sensores;
int potenciometro1;

int posi;

void setup()
{
 size(400,400);
 port= new Serial(this, Serial.list()[0],9600);
 //se deja igual que el servidor
 cliente4 = new OscP5(this,10000);
 //"localhost" para conectarlo con mi propio computador
 dirIp4 = new NetAddress("localhost",10000);
}
void draw(){
 background(255);
 if(0<port.available())
 {
  sensores = port.readStringUntil('\n');
   //String[] datosSensor = split(sensores,'T');
   if(sensores != null){  
      potenciometro1 = int(trim(sensores));     
      OscMessage miMns= new OscMessage("/test2");
      posi = (int)map(potenciometro1,0,255,300,560);
      miMns.add(posi);
      cliente4.send(miMns,dirIp4);
          println(posi);  
      }
   }
}
//envìa informaciòn mientras se mueve el mouse
//void mouseMoved(){
 //OscMessage miMns= new OscMessage("/test2");
 //miMns.add(mouseY);
 //miMns.add(mouseY);
 //cliente3.send(miMns,dirIp3);
//}
