import netP5.*;
import oscP5.*;
import processing.serial.*;

OscP5 cliente;
NetAddress dirIp;

Serial port;

String sensores;
int potenciometro1;

int posi;

void setup()
{
 size(400,400);
 port= new Serial(this, Serial.list()[0],9600);
 //se deja igual que el servidor
 cliente = new OscP5(this,10000);
 //"localhost" para conectarlo con mi propio computador
 dirIp = new NetAddress("localhost",10000);
}
void draw(){
 background(255);
 if(0<port.available())
 {
  sensores = port.readStringUntil('\n');
   //String[] datosSensor = split(sensores,'T');
   if(sensores != null){  
      potenciometro1 = int(trim(sensores));     
      OscMessage miMns= new OscMessage("/test");
      posi = (int)map(potenciometro1,0,255,0,260);
      miMns.add(posi);
      cliente.send(miMns,dirIp);
          println(posi);  
      }
   }
 }

//envìa informaciòn mientras se mueve el mouse
//void mouseMoved(){
 //OscMessage miMns= new OscMessage("/test");
 //miMns.add(mouseY);
 //miMns.add(mouseY);
 //cliente.send(miMns,dirIp);
//}
