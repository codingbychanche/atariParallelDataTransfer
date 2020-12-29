; 6502 Firmware
;
; Opens, closes a comm. channel 
; Sends one byte to the parallel interface
;
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
; Port A	Pin		Bit
;			1 - 4	1 - 4		Data				OUTPUT: Either Heigh (1) or Low (0)
; Strig0	6		-			Acknoledge (ACK)	INPUT:	Low (0) means=> receiever: Last 4 bits processed, waiting for next....
;
; Port B	1		16			Ready (RDY)			OUTPUT: Heigh (1):I have set 4 Bits for Output, pls process, I'am waiting for ACK	
;			2		32			End   (END)			OUTPUT: Height (1):All data send, terminate connection
;			3		64			Direction (DR)		OUTPUT: Heigh (1): Receieve// Low (0): I'am the sender, pls listen.	Not used yet


;
; Open comunication channel
;
; Init PIA
;

open
	txa
	pha
	tya
	pha
	
	lda #48				; Set Port A and B to output 
	sta pactl
	lda #0				; All pins to low
	sta porta	
			
	lda #32				; Pull End to low: I will be sending data, please listen!
	eor porta
	sta porta
			
	pla
	tay
	pla
	tax
	
	rts
	
;	
; Close 
;
		
close
	txa
	pha
	tya
	pha
	
	lda #32				; Pull end to high All data send, end connection.
	ora porta
	sta porta
	
	lda #16				; Erase ready status. Receiever: Don't receieve!
	eor porta			
	sta porta

	lda #52				; Change porta back from dtr register to receieving register!
	sta pactl
	lda #0
	sta porta
	
	sta bytetoprint
	;jsr binout
	
	pla
	tay
	pla
	tax
			
	rts
	
;
; Send one byte
;
; Returns:
;	Carry clear	:	No error!
;	Carry set	: 	When time out error
;		

; Constants 

time_out_time	equ 100	; Aprox 2.5 sec's until timeout error and connection is terminated.

; Var's

byte_to_send
	.byte 0
	
send_byte
	txa
	pha
	tya
	pha
	
send1nibble				; Send first nibble
	lda porta
	sta bytetoprint
	;jsr binout
			
	lda byte_to_send
	and #15				; Cut low nibble
	ora porta
	sta porta
	lda #16				; Ready. Receiever: Please process
	ora porta
	sta porta
	sta bytetoprint
	;jsr binout
		
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
	;jsr binout
			
	jsr clearlow
		
	lda byte_to_send
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
	;jsr binout
			
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
			
	lda #16				; Erase ready status
	eor porta			
	sta porta
	sta bytetoprint
	;jsr binout

	pla
	tay
	pla
	tax
	
	clc
	rts
	
time_out_error
	pla
	tay
	pla
	tax
	
	sec 				; Set carry to indicate error!
	rts
	
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
	
;---------------------------------------------------------------------------------------------------------
; Debug routines
;

; BinOut
;
; Write contents of porta and status of strig0 (ACK) to memory location in binary (e.g. screen- ram)
;
; Parameters:
;	bytetoprint:	Contents of porta register
;	portabitmap:	Destination of result (binary output) => Must be initalized in calling routine!	
;
; Contents of strig0 will be written to adress of portabitmap+20
;

bytetoprint
	.byte	0
	
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
