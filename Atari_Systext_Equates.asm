; Atari OS- Memmory Map
;

; Zeropage

ZP		equ $e0
zp2		equ $e2
zp3		equ $e4
zp4		equ $e6
zp5		equ	$e8
zp6		equ $ea
zp7		equ $ec
zp8		equ $ee

; ANTIC

DLPTR	EQU 560	
VDLIST	EQU $200	 
NMIEN	EQU $D40E
WSYNC	EQU $D40A
VCOUNT	EQU $D40B
RTCLK	EQU $14
SDMCTL	EQU 559

; Colors

COLPF0S	EQU $D016 
COLPF1S	EQU $D017
COLPF2S	EQU $D018
COLPF3S	EQU $D019
COLBAKS	EQU $D01A

; Floating Point Routines

FRO1 	EQU 212
FRO2 	EQU 213
FASC 	EQU 55526		; Converts the flouting point # in fr0 into ascii
INBUFF 	EQU 243			
IFP 	EQU $D9AA

; CIO

ICCOM 	EQU $342      	; Comand
ICSTA	EQU $343		; Status after returning from CIOV
ICBAL 	EQU $344      	; Buffer adr. low
ICBAH 	EQU $345      	; Buffer adr. high
ICBALL 	EQU $348      	; Buffer size low
ICBALH 	EQU $349      	; Buffer size high
ICAX1 	EQU $34A      	; aux. byte 1
ICAX2 	EQU $34B      	; aux. byte 2 
CIOV 	EQU $E456     	; CIO start

; PIA

porta 	equ $d300 
pactl 	equ $d302		; When 48=> set Port A/B? as output 
strig0	equ $284		; 0= High// 1= Low

; Keyboard

CONSOL	EQU $d01f