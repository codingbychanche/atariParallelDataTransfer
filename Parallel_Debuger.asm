; Parallel Debuger
;
; Sends to the parallel interface
; connected to the two Joystick ports (Port A and Port B) of
; an Atari 8- Bit computer.
;
; Testet with Atari 800 XL.
; 
; Copy the binary to an '*.atr' disk image using the 'MakePicoDos-sh'- script.
;
; Usefull to debug your interface. Displays all the registers on screen.
;
; BF 2019
;

	icl 'Atari_Systext_Equates.asm'

;
; So let the show begin!
;
	org $a800			

;
; Set up the screen
;

startagain
	lda #<screen		; Antic PRG
	sta DLPTR
	lda #>screen
	sta DLPTR+1
	
	lda #<sending		; Print status
	sta statusmsg
	lda #>sending
	sta statusmsg+1
	
	lda #<empty			; No error so far.....
	sta errormsg
	lda #>empty
	sta errormsg+1
	
;
; Bytes will be send low nibble first, high nibble second.
;

	jsr open			 ; Open comm channel
	ldx #0
send	
	lda buffer,x		; Send..
	sta byte_to_send
	jsr send_byte
	bcs time_out
	inx
	cpx #255
	bne send		

	jsr close
					
; 
; Wait until start- key is pressed.
;

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
; Time out error
;
; Receiever did not send an ACK
;

time_out
	lda #<time_out_text
	sta errormsg
	lda #>time_out_text
	sta errormsg+1
	
	jsr close
	
	jmp st
	
;
; Firmware
;

	icl 'Parallel_Interface_Firmware.asm'
	
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
; Data area 
;

bytetosend
	.byte 0

buffer
	.byte 10,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!$%&/()=,;:+-*#"
	.byte "Hallo Welt, wie geht es dir?"
	
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
	
;
; Contents of screen ram
;
	
screenram
	.byte "SERIAL DEBUGGER V1.5"
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

; Status and error messages
;

empty
	.byte "----------------------------------------"
sending
	.byte "Press <START> key to send               "
pressstart
	.byte "Press <START> for next session          "
sucess
	.byte "All data send, no error's               "
time_out_text
	.byte "Time out error, check connection!       "
;
; End of binary
;

end
	.byte 0	
