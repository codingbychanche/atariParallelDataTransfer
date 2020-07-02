; Parallel Debuger
;
; Sends and receieves over/ from a parallel interface
; connected to the two Joystick ports (Port A and Port B) of
; an Atari 8- Bit computer.
;
; Testet with Atari 800 XL
; A executable *.atr file will be created (a bootable disk image).
; Simply rename the *xex file to *.atr....
;
; Usefull to debug your interface. Displays all the registers on screen.
;
; BF 2019
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

; PIA

porta 	equ $d300 
pactl 	equ $d302	; When 48=> set Port A/B? as output 
strig0	equ $284	; 0= High// 1= Low

time_out_time	equ 100		; Aprox 2.5 sec's until timeout error and connection is terminated.

; Keyboard

CONSOL	EQU $d01f

;
; So let the show begin!
;
	org $a800
	
; Status of PortA and PortB is stored at $d300.
; ----------------------------------------------
;
; 			PortA		   |Port B
; $d300		001|002|004|008|016|032|064|128
; Pin        1   2   3   4 | 1   2   3   4		
;
; Pin assignments
; ---------------	
; Data direction refers to: "6502 machine is sender/ other machine receieves"				
;
; Port A	Pin		
;			1 - 4	Data				OUTPUT: Either Heigh (1) or Low (0)
; Strig0	6		Acknoledge (ACK)	INPUT:	Low (0) means=> receiever: Last 4 bits processed, waiting for next....
;
; Port B	1		Ready (RDY)			OUTPUT: Heigh (1):I have set 4 Bits for Output, pls process, I'am waiting for ACK	
;			2		End   (END)			OUTPUT: Height (1):All data send, terminate connection
;			3		Direction (DR)		OUTPUT: Heigh (1): Receieve// Low (0): I'am the sender, pls listen.				

;
; Set up the screen
;

startagain
	lda #<screen				; Antic PRG
	sta DLPTR
	lda #>screen
	sta DLPTR+1
	
	lda #<sending				; Print status
	sta statusmsg
	lda #>sending
	sta statusmsg+1
	
	lda #<empty					; No error so far.....
	sta errormsg
	lda #>empty
	sta errormsg+1

; Start of core routine	--------------------------------------------------
; Open -------------------------------------------------------------------

;
; Init PIA
;
			lda #48				; Set Port A and B to output 
			sta pactl
			lda #0				; All pins to low
			sta porta	
			
			lda #64				; I will be sending data, please listen!
			ora porta
			sta porta
	
; Put bytes ---------------------------------------------------------------
		
; Bytes will be send low nibble first, high nibble second.
;
			ldx #0
			
send1nibble						; Send first nibble
			LDA PORTA
			sta bytetoprint
			jsr binout
			
			lda buffer,x
			and #15				; Cut low nibble
			ora porta
			sta porta
			lda #16				; Ready. Please process
			ora porta
			sta porta
			sta bytetoprint
			jsr binout
		
			lda #0				; Init system timer...
			sta $14
			
wait4ack
			lda $14				; Check for timeout
			cmp #time_out_time	; sec's to timeout.....
			bne wwt1
			jmp time_out_error
wwt1
			lda strig0			; Wait for acknowledge from reciever
			bne wait4ack		; If low (1) wait....
		
			lda #16				; Erase ready status
			eor porta
			sta porta
			sta bytetoprint
			jsr binout
			
			jsr clearlow
		
			lda buffer,x
			and #240			; Cut high nibble
			lsr					; Shift high- to low nibble
			lsr
			lsr
			lsr
			ora porta
			sta porta
			
			lda #16				; Ready. Please process high nibble
			ora porta
			sta porta
			sta bytetoprint
			jsr binout
			
			lda #0				; Init system timer...
			sta $14
wait42ack
			lda $14
			cmp #time_out_time	; Timeout after x sec.....
			bne wtt2
			jmp time_out_error
wtt2
			lda strig0
			bne wait42ack
			
			jsr clearlow
		
			inx
			cpx #255
			beq all_send
			
			lda #16				; Erase ready status
			eor porta			; TEST
			sta porta
			sta bytetoprint
			jsr binout
			
			jmp send1nibble
all_send
			jsr close
					
; End of core routine ---------------------------------------------------------------

st	
	lda #<pressstart
	sta statusmsg
	lda #>pressstart
	sta statusmsg+1

	jsr wait
	lda consol			; Now wait until the start key is pressed
	and #1
	bne st 
	jmp startagain

;	
; Close 
;
		
close
	lda #32				; End of High (1). All data send, end connection.
	ora porta
	sta porta
			
	lda #16				; Erase ready status. Receiever: Don't receieve!
	eor porta			
	sta porta
			
	sta bytetoprint
	jsr binout
			
	rts
	
;
; Time out error
;
; Receiever did not send an ACK
;

time_out_error
	lda #<time_out
	sta errormsg
	lda #>time_out
	sta errormsg+1
	
	jsr close
	
	jmp st
;
; Clear low nibble of Port A
;

clearlow
	lda porta			; Clear low nibble
	lsr
	lsr
	lsr
	lsr
	asl
	asl
	asl
	asl	
	sta porta
	
	rts

;
; Wait
;

wait
	txa
	pha
	tya
	pha
		
	ldx #200
wloop1
	ldy #200
wloop2
	dey
	bne wloop2
	dex
	bne wloop1
	
	pla
	tay
	pla
	tax
	
	rts
;
; BinOut
;
; Prints 8-Bit number stored in accumulator to the screen
; and shows contents of strig0 (ACK)
;

binout
	txa
	pha
	tya
	pha
	
	ldy #14
	ldx #8
	
loop
	clc				; Send char...	
	lda bytetoprint
	asl				
	sta bytetoprint
	lda #"0"        ; If bit was not set print "0"
	adc #0	    	; add carry if set and print "1"
	sta portabitmap,y		
	dey
	dey
	dex			
	bne loop		; Until all bits send

	lda strig0
	cmp #0
	bne one
	lda #"0"
	sta portabitmap+20
	jmp notone
one
	lda #"1"
	sta portabitmap+20
notone
	pla
	tay
	pla
	tax
	
	rts
	
bytetoprint
	.byte	0

bytetosend
	.byte 0

buffer
	.byte 65,66,67,68,69
	.byte "Hallo Welt",10
	
;
; Display list
; 			

screen						 	
	.byte 112					
	.byte $40+$06,a(screenram)
	.byte 112
:10	.byte $02
	
	.byte $40+$02
errormsg
	.byte 0,0
	
	.byte $40+$02
statusmsg
	.byte 0,0
	
	.byte 112
	.byte $41,a(screen)	
	
screenram
	.byte "SERIAL DEBUGGER V1.2"
	.byte "Port A !Port B      Strig0              "
	.byte ".......!................................"
	.byte "       !R E D       A                   "
	.byte "Data   !D N T       C                   "
	.byte "1 2 3 4!Y D R       K                   "
	.byte ".......!................................"
portabitmap	
	.byte "                                        "
	.byte "                                        "
:400 .byte 0

end
	.byte 0	
	
; Status and error messages
empty
	.byte "----------------------------------------"
sending
	.byte "Sending............                     "
pressstart
	.byte "Press <START> to send again....         "
sucess
	.byte "All data send, no error's               "
time_out
	.byte "Time out error, check connection!       "
