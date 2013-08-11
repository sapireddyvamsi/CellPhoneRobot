/**
 * © Sohil Patel 2013, Some Rights Reserved
 *
 *	This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. 
 *  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.
 * 
 * 
 * */

int motor1Pin1 = 4;
int motor1Pin2 = 5;
int motor2Pin1 = 2;
int motor2Pin2 = 3;
int motorsPinEnable = 7;
int i=0,k=0,m=0;

void setup()
{
	pinMode(motor1Pin1, OUTPUT);
	pinMode(motor1Pin2, OUTPUT);
	pinMode(motor2Pin1, OUTPUT);
	pinMode(motor2Pin2, OUTPUT);
	pinMode(motorsPinEnable, OUTPUT);
	digitalWrite(motorsPinEnable,HIGH);
	DDRC = 0x00;
	DDRD = 0xFF;
}
void loop()
{
	i = PINC;
	k = i & 0xFF;
	if(m != k) {
		switch (k) {
		case 0x02: {
			forward();
			m=k;
			break;
		}
		case 0x18: {
			backward();
			m=k;
			break;
		}
		case 0x04: {
			left();
			m=k;
			break;
		}
		case 0x06: {
			right();
			m=k;
			break;
		}
		default: {
			m=0;
			break;
		}
		}
	}
}
void forward()
{
	digitalWrite(motorsPinEnable,HIGH);
	digitalWrite(motor1Pin1, LOW);
	digitalWrite(motor1Pin2, HIGH);
	digitalWrite(motor2Pin1, HIGH);
	digitalWrite(motor2Pin2, LOW);
	delay(1000);
	digitalWrite(motorsPinEnable,LOW);
}
void backward()
{
	digitalWrite(motorsPinEnable,HIGH);
	digitalWrite(motor1Pin1, HIGH);
	digitalWrite(motor1Pin2, LOW);
	digitalWrite(motor2Pin1, LOW);
	digitalWrite(motor2Pin2, HIGH);
	delay(1000);
	digitalWrite(motorsPinEnable,LOW);
}
void left()
{
	digitalWrite(motorsPinEnable,HIGH);
	digitalWrite(motor1Pin1, LOW);
	digitalWrite(motor1Pin2, HIGH);
	digitalWrite(motor2Pin1, LOW);
	digitalWrite(motor2Pin2, HIGH);
	delay(1000);
	digitalWrite(motorsPinEnable,LOW);
}
void right()
{
	digitalWrite(motorsPinEnable,HIGH);
	digitalWrite(motor1Pin1, HIGH);
	digitalWrite(motor1Pin2, LOW);
	digitalWrite(motor2Pin1, HIGH);
	digitalWrite(motor2Pin2, LOW);
	delay(1000);
	digitalWrite(motorsPinEnable,LOW);
}

