
_afficheChiffre:

;I2C.c,9 :: 		void afficheChiffre(char chiffre,char position){
;I2C.c,10 :: 		LATA = 0x01 << position;  //Change de position dans le 7 segment
	MOVF        FARG_afficheChiffre_position+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__afficheChiffre22:
	BZ          L__afficheChiffre23
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__afficheChiffre22
L__afficheChiffre23:
	MOVF        R0, 0 
	MOVWF       LATA+0 
;I2C.c,11 :: 		switch(chiffre){//  Met les bits ? 1 ou O en fonction du chiffre a afficher
	GOTO        L_afficheChiffre0
;I2C.c,12 :: 		case 0:LATD0_bit = 1;LATD1_bit = 1; LATD2_bit = 1;LATD3_bit = 1;
L_afficheChiffre2:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,13 :: 		LATD4_bit = 1;LATD5_bit = 1;LATD6_bit = 0;LATD7_bit = 0;
	BSF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BCF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,14 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,15 :: 		case 1:LATD0_bit = 0;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 0;
L_afficheChiffre3:
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BCF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,16 :: 		LATD4_bit = 0;LATD5_bit = 0;LATD6_bit = 0;LATD7_bit = 0;
	BCF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BCF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,17 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,18 :: 		case 2:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 0;LATD3_bit = 1;
L_afficheChiffre4:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BCF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,19 :: 		LATD4_bit = 1;LATD5_bit = 0;LATD6_bit = 1;LATD7_bit = 0;
	BSF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,20 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,21 :: 		case 3:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 1;
L_afficheChiffre5:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,22 :: 		LATD4_bit = 0;LATD5_bit = 0;LATD6_bit = 1;LATD7_bit = 0;
	BCF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,23 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,24 :: 		case 4:LATD0_bit = 0;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 0;
L_afficheChiffre6:
	BCF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BCF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,25 :: 		LATD4_bit = 0;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
	BCF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,26 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,27 :: 		case 5:LATD0_bit = 1;LATD1_bit = 0;LATD2_bit = 1;LATD3_bit = 1;
L_afficheChiffre7:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BCF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,28 :: 		LATD4_bit = 0;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
	BCF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,29 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,30 :: 		case 6:LATD0_bit = 1;LATD1_bit = 0;LATD2_bit = 1;LATD3_bit = 1;
L_afficheChiffre8:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BCF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,31 :: 		LATD4_bit = 1;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
	BSF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,32 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,33 :: 		case 7:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 0;
L_afficheChiffre9:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BCF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,34 :: 		LATD4_bit = 0;LATD5_bit = 0;LATD6_bit = 0;LATD7_bit = 0;
	BCF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BCF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BCF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,35 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,36 :: 		case 8:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 1;
L_afficheChiffre10:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,37 :: 		LATD4_bit = 1;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
	BSF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,38 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,39 :: 		case 9:LATD0_bit = 1;LATD1_bit = 1;LATD2_bit = 1;LATD3_bit = 1;
L_afficheChiffre11:
	BSF         LATD0_bit+0, BitPos(LATD0_bit+0) 
	BSF         LATD1_bit+0, BitPos(LATD1_bit+0) 
	BSF         LATD2_bit+0, BitPos(LATD2_bit+0) 
	BSF         LATD3_bit+0, BitPos(LATD3_bit+0) 
;I2C.c,40 :: 		LATD4_bit = 0;LATD5_bit = 1;LATD6_bit = 1;LATD7_bit = 0;
	BCF         LATD4_bit+0, BitPos(LATD4_bit+0) 
	BSF         LATD5_bit+0, BitPos(LATD5_bit+0) 
	BSF         LATD6_bit+0, BitPos(LATD6_bit+0) 
	BCF         LATD7_bit+0, BitPos(LATD7_bit+0) 
;I2C.c,41 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,42 :: 		default:
L_afficheChiffre12:
;I2C.c,43 :: 		break;
	GOTO        L_afficheChiffre1
;I2C.c,44 :: 		}
L_afficheChiffre0:
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre2
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre3
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre4
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre5
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre6
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre7
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre8
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre9
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre10
	MOVF        FARG_afficheChiffre_chiffre+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_afficheChiffre11
	GOTO        L_afficheChiffre12
L_afficheChiffre1:
;I2C.c,45 :: 		}
L_end_afficheChiffre:
	RETURN      0
; end of _afficheChiffre

_afficheNombre:

;I2C.c,48 :: 		void afficheNombre(int var){
;I2C.c,51 :: 		chiffre3 = var/1000;
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        FARG_afficheNombre_var+0, 0 
	MOVWF       R0 
	MOVF        FARG_afficheNombre_var+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
;I2C.c,52 :: 		var -= chiffre3*1000;
	MOVLW       0
	MOVWF       R1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        R0, 0 
	SUBWF       FARG_afficheNombre_var+0, 0 
	MOVWF       FLOC__afficheNombre+0 
	MOVF        R1, 0 
	SUBWFB      FARG_afficheNombre_var+1, 0 
	MOVWF       FLOC__afficheNombre+1 
	MOVF        FLOC__afficheNombre+0, 0 
	MOVWF       FARG_afficheNombre_var+0 
	MOVF        FLOC__afficheNombre+1, 0 
	MOVWF       FARG_afficheNombre_var+1 
;I2C.c,53 :: 		chiffre2 = var/100;
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__afficheNombre+0, 0 
	MOVWF       R0 
	MOVF        FLOC__afficheNombre+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       afficheNombre_chiffre2_L0+0 
;I2C.c,54 :: 		var -= chiffre2*100;
	MOVLW       100
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	SUBWF       FLOC__afficheNombre+0, 1 
	MOVF        R1, 0 
	SUBWFB      FLOC__afficheNombre+1, 1 
	MOVF        FLOC__afficheNombre+0, 0 
	MOVWF       FARG_afficheNombre_var+0 
	MOVF        FLOC__afficheNombre+1, 0 
	MOVWF       FARG_afficheNombre_var+1 
;I2C.c,55 :: 		chiffre1 = var/10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        FLOC__afficheNombre+0, 0 
	MOVWF       R0 
	MOVF        FLOC__afficheNombre+1, 0 
	MOVWF       R1 
	CALL        _Div_16x16_S+0, 0
	MOVF        R0, 0 
	MOVWF       afficheNombre_chiffre1_L0+0 
;I2C.c,57 :: 		var -= chiffre1*10;   //Chiffre apres la virgule
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	SUBWF       FLOC__afficheNombre+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
	SUBWFB      FLOC__afficheNombre+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_afficheNombre_var+0 
	MOVF        R1, 0 
	MOVWF       FARG_afficheNombre_var+1 
;I2C.c,60 :: 		afficheChiffre(chiffre0,0);// met un chiffrex sur la 1ere 7 segment
	MOVF        R0, 0 
	MOVWF       FARG_afficheChiffre_chiffre+0 
	CLRF        FARG_afficheChiffre_position+0 
	CALL        _afficheChiffre+0, 0
;I2C.c,61 :: 		Delay_ms(1); // Tempo
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_afficheNombre13:
	DECFSZ      R13, 1, 1
	BRA         L_afficheNombre13
	DECFSZ      R12, 1, 1
	BRA         L_afficheNombre13
	NOP
	NOP
;I2C.c,63 :: 		afficheChiffre(chiffre1,1);  // met un chiffre sur la 2eme 7 segment
	MOVF        afficheNombre_chiffre1_L0+0, 0 
	MOVWF       FARG_afficheChiffre_chiffre+0 
	MOVLW       1
	MOVWF       FARG_afficheChiffre_position+0 
	CALL        _afficheChiffre+0, 0
;I2C.c,64 :: 		Delay_ms(1); // Tempo
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_afficheNombre14:
	DECFSZ      R13, 1, 1
	BRA         L_afficheNombre14
	DECFSZ      R12, 1, 1
	BRA         L_afficheNombre14
	NOP
	NOP
;I2C.c,66 :: 		afficheChiffre(chiffre2,2);  // met un chiffre sur la 3eme 7 segment
	MOVF        afficheNombre_chiffre2_L0+0, 0 
	MOVWF       FARG_afficheChiffre_chiffre+0 
	MOVLW       2
	MOVWF       FARG_afficheChiffre_position+0 
	CALL        _afficheChiffre+0, 0
;I2C.c,67 :: 		Delay_ms(1); // Tempo
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_afficheNombre15:
	DECFSZ      R13, 1, 1
	BRA         L_afficheNombre15
	DECFSZ      R12, 1, 1
	BRA         L_afficheNombre15
	NOP
	NOP
;I2C.c,69 :: 		afficheChiffre(0,3); // met 0 a la derniere position sur 7 segment car le DS18S20 ne capte pas les temp?ratures de plus de 257?C (la nous somme ? mille sur le dernier 7 segment)
	CLRF        FARG_afficheChiffre_chiffre+0 
	MOVLW       3
	MOVWF       FARG_afficheChiffre_position+0 
	CALL        _afficheChiffre+0, 0
;I2C.c,70 :: 		Delay_ms(1); // Tempo
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_afficheNombre16:
	DECFSZ      R13, 1, 1
	BRA         L_afficheNombre16
	DECFSZ      R12, 1, 1
	BRA         L_afficheNombre16
	NOP
	NOP
;I2C.c,71 :: 		}
L_end_afficheNombre:
	RETURN      0
; end of _afficheNombre

_main:

;I2C.c,74 :: 		void main(void) {
;I2C.c,76 :: 		TRISA = 0x00;
	CLRF        TRISA+0 
;I2C.c,77 :: 		TRISD = 0x00;
	CLRF        TRISD+0 
;I2C.c,78 :: 		TRISE.B2 = 1;
	BSF         TRISE+0, 2 
;I2C.c,79 :: 		ANSELA = 0;                // Configure PORTA pins as digital
	CLRF        ANSELA+0 
;I2C.c,80 :: 		ANSELB = 0x00;                 // Configure PORTB pins as digital
	CLRF        ANSELB+0 
;I2C.c,81 :: 		ANSELC = 0;
	CLRF        ANSELC+0 
;I2C.c,82 :: 		ANSELE = 0;
	CLRF        ANSELE+0 
;I2C.c,84 :: 		I2C1_Init(100000);
	MOVLW       20
	MOVWF       SSP1ADD+0 
	CALL        _I2C1_Init+0, 0
;I2C.c,86 :: 		UART1_Init(9600);                // Initialize UART module at 9600 bps
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;I2C.c,88 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;I2C.c,89 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;I2C.c,95 :: 		do {
L_main17:
;I2C.c,97 :: 		Ow_Reset(&PORTE, 2);                    // reinitialiser le DS1820 connecte
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Reset_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Reset_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;I2C.c,98 :: 		Ow_Write(&PORTE, 2, 0xCC);              // Issue command SKIP_ROM
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;I2C.c,99 :: 		Ow_Write(&PORTE, 2, 0x44);              // Issue command CONVERT_T
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       68
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;I2C.c,101 :: 		Ow_Reset(&PORTE, 2);
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Reset_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Reset_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Reset_pin+0 
	CALL        _Ow_Reset+0, 0
;I2C.c,102 :: 		Ow_Write(&PORTE, 2, 0xCC);
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       204
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;I2C.c,103 :: 		Ow_Write(&PORTE, 2, 0xBE);
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Write_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Write_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Write_pin+0 
	MOVLW       190
	MOVWF       FARG_Ow_Write_data_+0 
	CALL        _Ow_Write+0, 0
;I2C.c,105 :: 		temp =  Ow_Read(&PORTE, 2)/1.8;
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Read_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	CALL        _byte2double+0, 0
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
;I2C.c,106 :: 		temp = ((Ow_Read(&PORTE, 2) << 8) + temp)/1.8;
	MOVLW       PORTE+0
	MOVWF       FARG_Ow_Read_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Ow_Read_port+1 
	MOVLW       2
	MOVWF       FARG_Ow_Read_pin+0 
	CALL        _Ow_Read+0, 0
	MOVF        R0, 0 
	MOVWF       R3 
	CLRF        R2 
	MOVF        _temp+0, 0 
	ADDWF       R2, 0 
	MOVWF       R0 
	MOVF        _temp+1, 0 
	ADDWFC      R3, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
;I2C.c,109 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;I2C.c,110 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW       162
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;I2C.c,111 :: 		I2C1_Wr(2);                // send byte (address of EEPROM location)
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;I2C.c,112 :: 		I2C1_Wr(temp);             // send data (data to be written)
	MOVF        _temp+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;I2C.c,113 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;I2C.c,115 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;I2C.c,118 :: 		I2C1_Start();              // issue I2C start signal
	CALL        _I2C1_Start+0, 0
;I2C.c,119 :: 		I2C1_Wr(0xA2);             // send byte via I2C  (device address + W)
	MOVLW       162
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;I2C.c,120 :: 		I2C1_Wr(2);                // send byte (data address)
	MOVLW       2
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;I2C.c,121 :: 		I2C1_Repeated_Start();     // issue I2C signal repeated start
	CALL        _I2C1_Repeated_Start+0, 0
;I2C.c,122 :: 		I2C1_Wr(0xA3);             // send byte (device address + R)
	MOVLW       163
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;I2C.c,123 :: 		tempo = I2C1_Rd(0);        // Read the data (NO acknowledge)
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
	MOVLW       0
	MOVWF       _tempo+1 
;I2C.c,125 :: 		I2C1_Stop();               // issue I2C stop signal
	CALL        _I2C1_Stop+0, 0
;I2C.c,126 :: 		afficheNombre(tempo);
	MOVF        _tempo+0, 0 
	MOVWF       FARG_afficheNombre_var+0 
	MOVF        _tempo+1, 0 
	MOVWF       FARG_afficheNombre_var+1 
	CALL        _afficheNombre+0, 0
;I2C.c,128 :: 		IntToStr(tempo, tempo);
	MOVF        _tempo+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _tempo+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVF        _tempo+0, 0 
	MOVWF       FARG_IntToStr_output+0 
	MOVF        _tempo+1, 0 
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;I2C.c,130 :: 		UART1_Write_Text(tempo);         // send data via UART
	MOVF        _tempo+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        _tempo+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;I2C.c,132 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
	NOP
;I2C.c,135 :: 		}while (1);
	GOTO        L_main17
;I2C.c,136 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
