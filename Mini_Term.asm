; Mini Term
;
; Send's and receieves
;
; BF 2019

	icl 'Atari_Systext_Equates.asm'
;
; Main........
;
	org $a800

start
	lda #<screen
	sta 88
	lda #>screen
	sta 89
	
	lda #<null		; Show cursor
	ldy #>null
	jsr print
	
	lda #<dlist		; Antic PRG
	sta DLPTR
	lda #>dlist
	sta DLPTR+1
	
endless
	lda #<inputbuffer
	ldy #>inputbuffer
	jsr get					; Get string
	lda inputbuffer
	cmp #'!'
	beq command
noCommand
	jsr print_sending
	jsr send				; Send string
	jmp endless				; Get next string.....
command
	jsr evaluateCommand		; Eval and execute command...
	jmp endless
;
; Send
;

bytes_send
	.byte 0

send
	txa
	pha
	tya
	pha
	
	jsr open
	ldx #0
	stx bytes_send
get_next_byte
	lda inputbuffer,x
	cmp #$9b
	beq send_sucessfully
	sta byte_to_send
	jsr send_byte
	bcs time_out_occured
	ldx bytes_send
	inx
	stx bytes_send
	jmp get_next_byte
	
send_sucessfully
	stx bytes_send
	jsr close
	lda bytes_send
	bne data_was_send
	stx bytes_send
	jsr print_no_input
	jmp return
	
data_was_send
	lda bytes_send
	sta fro1
	lda #0
	sta fro2
	lda #<(text_success+27)
	sta zp
	lda #>(text_success+27)
	sta zp+1
	
	jsr toascii					; Conv. contents of 'fro' into ascii
	jsr print_success			; Print sucess message and # of bytes send...
		
	jmp return

time_out_occured
	jsr close
	jsr print_time_out_error
	jmp return
	
return
	pla
	tay
	pla
	tax	
	rts
	
;
; User did input a command, evaluate..
;
evaluateCommand
	txa
	pha
	tya
	pha
	
	jsr print_help	; Test....

	pla
	tay
	pla
	tax	
	
	rts

;
; Print various messages...
;

print_sending
	lda #<text_sending
	ldy #>text_sending
	jsr print
	rts
	
print_time_out_error
	lda #<text_time_out_err
	ldy #>text_time_out_err
	jsr print
	rts
	
print_success
	lda #<text_success
	ldy #>text_success
	jsr print
	rts
	
print_no_input
	lda #<text_no_input
	ldy #>text_no_input
	jsr print
	rts
	
print_help
	lda #<text_help
	ldy #>text_help
	jsr print
	rts
	
;
; Converts float value in 'fro' to ascii
; Result is written to adress stored in 'zp' ($eo)
;
toascii
	jsr ifp				; Value in 'fro1' and 'fro2' from integer to float
	jsr fasc			; Float to integer
	
	ldy #0		
num
  	lda (INBUFF),Y		; Inbuff points to ascii value...
  	bmi done    		; Copy ascii value to adress 'zp' points to
  	sta (zp),y
  	iny
  	bne num
done     
 	clc                            
 	sbc #127     
  	sta (zp),y
  	rts
  	 	
;
; Prints a string
;
; String adr. low A
; String adr. high Y

print 
	ldx #0      	; iocb #0
  	sta icbal,x   
  	tya           
  	sta icbah,x   
  	lda #80       
  	sta icball,x
  	lda #0
  	sta icbalh,x  
  	lda #9          ; comand 'put text'
  	sta iccom,x
  	jsr ciov        ; call cio
  	rts
  
; Get String (input)
; 
; String adr. low A
; String adr. high Y
; 
 
get 
	ldx #0      	; iocb #0 
  	sta icbal,x   
  	tya           
  	sta icbah,x   
  	lda #255      
  	sta icball,x
  	lda #0
  	sta icbalh,x  
  	lda #4       
  	sta iccom,x
  	jsr ciov     
  	rts
  
;
; Firmware
;

	icl 'Parallel_Interface_Firmware.asm'
	
;
; Data
;

null
	.byte ' ',$9b
titel
	.byte "MINI TERM V1.0 BF                       "

status
	.byte "Bytes send 0000 // Bytes received 0000  "
text_sending
	.byte '>> Sending .......',$9b
text_time_out_err
	.byte '   Time out error!                      ',$9b
text_success
	.byte '   Bytes send successfully:             ',$9b
text_no_input
	.byte '   No input, nothing send.....          ',$9b
text_help
	.byte 'Type: !<help/dir/save/load>.            ',$9b


inputbuffer
:255	.byte 0

portabitmap
:40		.byte

dlist					 	
	.byte 112,112				
	.byte $40+$02,a(titel)
	.byte 0
	.byte $40+$02,a(status)
	.byte 0
	.byte $40+$02,a(screen)
:23	.byte $02
	
	.byte 112
	.byte $41,a(dlist)	
	
screen
:2000	.byte
	
