#include <MFRC522.h>
#include <SPI.h>

#define SS_PIN 10
#define RST_PIN 9
 
MFRC522 rfid(SS_PIN, RST_PIN); // Instance of the class

MFRC522::MIFARE_Key key; 

int codeRead = 0;
int cardBeenRead = 0;
uint32_t lastCardRead = 0;
int waitForIt = 0;
String uidString;
void setup() {  
  Serial.begin(9600);
  SPI.begin(); // Init SPI bus
  rfid.PCD_Init(); // Init MFRC522 
  rfid.PCD_SetRegisterBitMask(rfid.RFCfgReg, (0x03<<4));
  pinMode(8,OUTPUT);
  pinMode(A0,OUTPUT);
  Serial.println("loaded"); 
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
}

void loop() {
  if ((waitForIt == 0) && (cardBeenRead == 0)) {
    Serial.println(". rfid_process.sh noscan");
  }

  waitForIt++;

  if (waitForIt >= 9) {
    waitForIt = 0;
  }  
  
  if(  rfid.PICC_IsNewCardPresent())
  {
      readRFID();
  }
  delay(100);
}

void readRFID()
{  
  rfid.PICC_ReadCardSerial();  
  MFRC522::PICC_Type piccType = rfid.PICC_GetType(rfid.uid.sak);
 
  if (piccType != MFRC522::PICC_TYPE_MIFARE_MINI &&  
    piccType != MFRC522::PICC_TYPE_MIFARE_1K &&
    piccType != MFRC522::PICC_TYPE_MIFARE_4K) {
    //tag is a MIFARE Classic."
    return;
  }  
    
    uint32_t cardid = rfid.uid.uidByte[0];
    cardid <<= 8;
    cardid |= rfid.uid.uidByte[1];
    cardid <<= 8;
    cardid |= rfid.uid.uidByte[2];  
    cardid <<= 8;
    cardid |= rfid.uid.uidByte[3]; 

    cardBeenRead = 1;
    
    if (cardid != lastCardRead) {
      digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)      
      Serial.print(". rfid_process.sh ");
      Serial.println(cardid);
      lastCardRead = cardid;
      delay(1000);                       // wait for a second
      digitalWrite(LED_BUILTIN, LOW);    // turn the LED off by making the voltage LOW
    }

    // Halt PICC
  rfid.PICC_HaltA();

  // Stop encryption on PCD
  rfid.PCD_StopCrypto1();
}
