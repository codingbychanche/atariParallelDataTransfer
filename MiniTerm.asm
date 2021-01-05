; Mini Term
;
; Send's and receieves
;
; BF 2019

	icl 'Atari_Systext_Equates.asm'
	
lf	equ $9b		; Linefeed

;
; Main........
;
	org $3360		; Just after DUP- Sys....

	lda #<dlist		; Antic PRG
	sta DLPTR
	lda #>dlist
	sta DLPTR+1
	
start
	lda #<commandline	; Keyboard input takes place in the command line
	sta 88
	lda #>commandline
	sta 89
	
	lda #0				; Set cursor to row / column 0
	sta 82				; Right column.
	sta 84				; Set cursor to row 0
	jsr print_lf		; Print lf to enable the changes made above....

endless
	lda 84				; After one line was entered, set cursor
	cmp #0				; back to first line.
	bcc g
	lda #0
	sta 84	
g
	lda #<inputbuffer
	ldy #>inputbuffer
	jsr get					; Get string
	lda inputbuffer
	cmp #'!'
	beq command
noCommand
	jsr clearCommandline
	jsr clearStatus
	jsr print_sending
	jsr send				; Send string
	jmp endless				; Get next string.....
command
	jsr clearCommandLine
	jsr evaluateCommand		; Eval and execute command...
	jmp endless	
;
; Copys the text just entered into
; the output buffer....Clears the command line....
;
clearCommandLine
	ldx #0
cl	
	lda inputbuffer,x
	sta echoOfCommand,x
	lda #0
	sta commandline,x
	inx
	cpx #39
	bne cl
	rts
;
; Clears status line
;
clearStatus
	ldx #120
	lda #0
cl1
	sta status,x
	dex
	bne cl1
	rts
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
	sta byte_to_send
	jsr send_byte
	bcs time_out_occured
	ldx bytes_send
	inx
	stx bytes_send
	
	lda inputbuffer,x
	cmp #lf			
	beq send_sucessfully
	
	jmp get_next_byte
	
send_sucessfully
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
	ldx #255					; Clear inbuffer
	lda #0
cl2
	sta inbuffer,x
	dex
	bne cl2
	
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
	
	;jsr print_help	; Test....
	jsr readDir

	pla
	tay
	pla
	tax	
	
	rts
;
; Print various status messages
; inside the status line
;
print_lf
	lda #<null
	ldy #>null
	jsr print
	jmp out
	
print_sending
	lda #<status
	sta 88
	lda #>status
	sta 89
	lda #0
	sta 84
	lda #<text_sending
	ldy #>text_sending
	jsr print
	jmp out
	
print_time_out_error
	lda #<status
	sta 88
	lda #>status
	sta 89
	lda #0
	sta 84
	lda #<text_time_out_err
	ldy #>text_time_out_err
	jsr print
	jmp out
	
print_success
	lda #<status
	sta 88
	lda #>status
	sta 89
	lda #0
	sta 84
	lda #<text_success
	ldy #>text_success
	jsr print
	jmp out
	
print_no_input
	lda #<status
	sta 88
	lda #>status
	sta 89
	lda #<text_no_input
	ldy #>text_no_input
	jsr print
	jmp out
	
print_help
	lda #<status
	sta 88
	lda #>status
	sta 89
	lda #0
	sta 84
	lda #<text_help
	ldy #>text_help
	jsr print
	jmp out
	
print_dir
	lda #<inBuffer
	sta 88
	lda #>inBuffer
	sta 89
	
	lda #<dir
	ldy #>dir
	jsr print
	jmp out
	
print_cio_error			
	sty fro1				; Cio error- code
	lda #0
	sta fro2
	lda #<(text_cio_error+10)
	sta zp
	lda #>(text_cio_error+10)
	sta zp+1
	jsr toascii

	lda #<status		
	sta 88
	lda #>status
	sta 89
	lda #0
	sta 84
	
	lda #<text_cio_error
	ldy #>text_cio_error
	jsr print
	jmp out
out
	lda #<commandline
	sta 88
	lda #>commandline
	sta 89
	
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
;  
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
; Read disk directory
;
readDir
	ldx #$20      	; iocb # x 16 => $20=32=#2 Same as Open #,x,x,"..."
	lda #<device
  	sta icbal,x   
  	lda #>device
  	sta icbah,x   
  	lda #3			; Open
  	sta iccom,x
  	lda #6			; Read dir
  	sta icax1,x
  	jsr ciov   
  	bmi cioError
  	
  	lda #<dir		; Buffer for dir- file
  	sta icbal,x   
  	lda #>dir
  	sta icbah,x  
l1
  	ldx #$20	
  	lda #255		; Max size of dir file....
  	sta icball,x
  	lda #3
  	sta icbalh,x
	lda #5			; Get record
  	sta iccom,x
  	jsr ciov   
  	bmi dirRead
  	jsr print_dir
  	jmp l1			; Read until all enries read....
  	
dirRead
 	rts
 	
cioError
 	jsr print_cio_error
 	rts
 	;;; Close!!!!!!!!!!!!

device
 	.byte 'D1:*.*'
;
; Firmware
;
	icl 'Parallel_Interface_Firmware.asm'	
;
; Data
;

null
	.byte ' ',lf

titel
	.byte "MINI TERM V1.85 BF                      "
	
statusTitel
	.byte "STATUS:                                 "
	
commandLineTitel
	.byte "SHELL:                                  "
status
:160 .byte 

text_sending
	.byte 'Sending:'	
echoOfCommand
:40	.byte 0
	.byte 0
	
inBufferTitel
	.byte "BUFFER:                                 "	
	
text_time_out_err
	.byte 'Time out error!                         ',lf
text_success
	.byte 'Bytes send successfully:                ',lf
text_no_input
	.byte 'No input, nothing send.....             ',lf
text_help
	.byte 'Type: !<help/dir/save/load>.            ',lf
	
text_cio_error
	.byte 'CIO Error:'
	.byte '                              ',lf

inputbuffer
:255	.byte 0

portabitmap
:40		.byte

dlist					 	
	.byte 112,112				
	.byte $40+$02,a(titel)
	.byte 0
	.byte $40+$02,a(statusTitel)
	.byte 0
	.byte $40+$02,a(status)
	.byte $02,$02
	.byte 0
	.byte $40+$02,a(inBufferTitel)
	.byte 0
inbufferAdr
	.byte $40+$02,a(inBuffer)
:16	.byte $02
	.byte 0
	.byte $40+$02,a(commandLineTitel)
	.byte 0
	.byte $40+$02,a(commandline)
	.byte 112
	.byte $41,a(dlist)	
	
commandline
:120	.byte

dir
:768	.byte

inBuffer
:8000	.byte 
	
