#line 1 "C:/Users/hamse/Desktop/Projet MikroC/Projet I2C/I2C.c"




unsigned temp;
int nombreaffiche;
int val;

void afficheChiffre(char chiffre,char position){
 LATA = 0x01 << position;
 switch(chiffre){
 case 0:LATD0_bit = 1;LATD1_bit = 1; LATD2_bit = 1;LATD3_bit = 1;
 LATD4_bit = 1;LATD5_bit = 1;LATD6_bit = 0;LATD7_bit = 0;
 break;
 case 1:LATD0_bit = 0;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 0;
 LATD4_bit = 0;LATD5_bit = 0;LATD6_bit = 0;LATD7_bit = 0;
 break;
 case 2:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 0;LATD3_bit = 1;
 LATD4_bit = 1;LATD5_bit = 0;LATD6_bit = 1;LATD7_bit = 0;
 break;
 case 3:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 1;
 LATD4_bit = 0;LATD5_bit = 0;LATD6_bit = 1;LATD7_bit = 0;
 break;
 case 4:LATD0_bit = 0;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 0;
 LATD4_bit = 0;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
 break;
 case 5:LATD0_bit = 1;LATD1_bit = 0;LATD2_bit = 1;LATD3_bit = 1;
 LATD4_bit = 0;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
 break;
 case 6:LATD0_bit = 1;LATD1_bit = 0;LATD2_bit = 1;LATD3_bit = 1;
 LATD4_bit = 1;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
 break;
 case 7:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 0;
 LATD4_bit = 0;LATD5_bit = 0;LATD6_bit = 0;LATD7_bit = 0;
 break;
 case 8:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 1;
 LATD4_bit = 1;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
 break;
 case 9:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 1;
 LATD4_bit = 0;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
 break;
 default:
 break;
 }
}


void afficheNombre(int var){

 char chiffre0,chiffre1, chiffre2,chiffre3;
 chiffre3 = var/1000;
 var -= chiffre3*1000;
 chiffre2 = var/100;
 var -= chiffre2*100;
 chiffre1 = var/10;

 var -= chiffre1*10;
 chiffre0 = (char)var;

 afficheChiffre(chiffre0,0);
 Delay_ms(1);

 afficheChiffre(chiffre1,1);
 Delay_ms(1);

 afficheChiffre(chiffre2,2);
 Delay_ms(1);

 afficheChiffre(0,3);
 Delay_ms(1);
}
 int tempo;
 char tab[3];
void main(void) {

 TRISA = 0x00;
 TRISD = 0x00;
 TRISE.B2 = 1;
 ANSELA = 0;
 ANSELB = 0x00;
 ANSELC = 0;
 ANSELE = 0;

 I2C1_Init(100000);

 UART1_Init(9600);


 UART1_Write(13);
 UART1_Write(10);

 do {

 Ow_Reset(&PORTE, 2);
 Ow_Write(&PORTE, 2, 0xCC);
 Ow_Write(&PORTE, 2, 0x44);

 Ow_Reset(&PORTE, 2);
 Ow_Write(&PORTE, 2, 0xCC);
 Ow_Write(&PORTE, 2, 0xBE);

 temp = Ow_Read(&PORTE, 2)/1.8;
 temp = ((Ow_Read(&PORTE, 2) << 8) + temp)/1.8;


 I2C1_Start();
 I2C1_Wr(0xA2);
 I2C1_Wr(2);
 I2C1_Wr(temp);
 I2C1_Stop();

 Delay_100ms();


 I2C1_Start();
 I2C1_Wr(0xA2);
 I2C1_Wr(2);
 I2C1_Repeated_Start();
 I2C1_Wr(0xA3);
 tempo = I2C1_Rd(0);

 I2C1_Stop();
 afficheNombre(tempo);



 UART1_Write(tempo);
 UART1_Write_Text("\n");



 }while (1);
}
