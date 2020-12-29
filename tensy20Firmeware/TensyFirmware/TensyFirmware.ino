/*
 * Receiever
 * 
 * This version does only receive data from the Atari.
 * 
 * BF 12/2020
 * 
 */

// HC05 BT- Module
#include <SoftwareSerial.h>
SoftwareSerial BT(7,8); 
String receieved_data;

// Pin assigements for parallel interface
//

// Input
int const IN_BIT_1=PIN_B0;    // Pin 1-4 of Port A when 1=0// when 0=1!
int const IN_BIT_2=PIN_B1;    // These 4 pins are either the low- or high- nibble of the byte currently send
int const IN_BIT_3=PIN_B2;
int const IN_BIT_4=PIN_B3;

int const RDY_PIN=PIN_D0;     // INPUT: Set to 'Hight' by sender, data ready, Receiver pls. get I'am waiting for ACKNOWLEDGE.
int const ACKNOWLEDGE=PIN_B7; // OUTPUT: Set to 'High' when nibble is processed. Ready to receieve next nibble
int const END_PIN=PIN_D1;     // 'High' means=> receiever has all data send.  
int const DTR_PIN=PIN_C6;     // 'High' means: Recievie data! 

// PIN_D2=RXD Serial receieve
// PIN D3=TXT Serial transmit


// Var's
//
// Input
int pinState_1;               // Bits 1 to 4 of the receieved nibble....
int pinState_2;
int pinState_3;
int pinState_4;

int end_state;
int end_last_state;

int rdy_state; 
int rdy_last_state; 

//int dtr_state;

unsigned char receieved_nibble;         // Nibble receieved
unsigned char receieved_byte;           // Byte receieved...  
int nibble_no;                          // 1= nibble 1, 2=nibble 2

/*
 * Init
 * 
 * Executed once after start...
 */

void setup() {

  // Setup HC05 BT Module
  //
  // HC05   <->   Tensy
  //  RX          TX (PIN 8)
  //  TX          RX (Pin 7)
  pinMode(8, OUTPUT);
  pinMode(7,INPUT);
  BT.begin(9600);

  // Setup parallel interface
  //
  // LOW means HIGH and vice versa !!!
  //
  pinMode(ACKNOWLEDGE,OUTPUT);  
  digitalWrite(ACKNOWLEDGE,HIGH); // Low=> I have not received anything yet...
  
  pinMode(IN_BIT_1,INPUT_PULLUP);
  pinMode(IN_BIT_2,INPUT_PULLUP);
  pinMode(IN_BIT_3,INPUT_PULLUP);
  pinMode(IN_BIT_4,INPUT_PULLUP);

  pinMode(END_PIN,INPUT_PULLUP);
  
  pinMode(RDY_PIN,INPUT_PULLUP);
  pinMode(DTR_PIN,INPUT_PULLUP);

  nibble_no=1;
  receieved_nibble=0;
}

/*
 * Main loop
 */
void loop() {

  //Serial.println("Waiting for input channel to open.....");

  //rdy_state=LOW;
  //rdy_last_state=LOW;
  end_state=digitalRead(END_PIN);
  
  // Receieve, until end state is low....
  //if (end_state==HIGH && end_last_state==LOW){ // Check if connection was openend, check for rising edge..

    // Serial.println("Connection opened.... Waiting for rdy....");
    
    rdy_state=digitalRead(RDY_PIN);
    //dtr_state=digitalRead(DTR_PIN);
   
    // Sending hardware is an 8- Bit 6502 little endian machine.
    // Bits and nibbles are receieved lsb first 
    if (rdy_state==LOW && rdy_last_state==HIGH){ // Wait for rising edge, sender tells: Get new nibble...

      Serial.println("RDY received, geting data...");

       // Data
      pinState_1=digitalRead(IN_BIT_1);
      pinState_2=digitalRead(IN_BIT_2);
      pinState_3=digitalRead(IN_BIT_3);
      pinState_4=digitalRead(IN_BIT_4);

      // Bin to decimal
      if (pinState_1==LOW)        
        receieved_nibble=receieved_nibble+1;
      if (pinState_2==LOW)
        receieved_nibble=receieved_nibble+2;
      if (pinState_3==LOW)
        receieved_nibble=receieved_nibble+4;
      if (pinState_4==LOW)
        receieved_nibble=receieved_nibble+8;

      // If first nibble (lsb)=> copy to byte
      if (nibble_no==1){
        receieved_byte=receieved_nibble;
        receieved_nibble=0;
        nibble_no=2;

        // Tell sender, ok, we have receieved. Send next nibble!
        digitalWrite(ACKNOWLEDGE,LOW);

        Serial.println("nibble 1");
        
      } else {
       
        nibble_no=1;
        receieved_nibble=receieved_nibble << 4;
        receieved_byte=receieved_byte | receieved_nibble;

        // Show result
        //Serial.println(receieved_byte);
       
        BT.write(receieved_byte);
       
        receieved_nibble=0;
        receieved_byte=0;

        // Tell sender, ok, we have receieved. Send next nibble!
        digitalWrite(ACKNOWLEDGE,LOW);

        Serial.println("Nibble 2");
      }
    } // Wait for rising edge, sender tells: Get new nibble...
    rdy_last_state=rdy_state; 
  //} // Check if connection is closed...
  end_last_state=end_state;
}
