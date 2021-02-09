; Mini Term
;
; Send's and receieves
;
; BF 2019

	icl 'Atari_Systext_Equates.asm'
	
lf			equ $9b		; Linefeed
linesize	equ $28		; Size of one line in bytes 

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

	lda #<inbuffer		; Zeropageregister holds
	sta zp8				; address of the buffer
	lda #>inbuffer
	sta zp8+1
	lda #0			
	sta totalNumberOfLines
	jsr calcInbufferSize
	jsr displayInbufferSize
;
; Handle user input inside the command line
;
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
; the status line....Clears the command line....
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
	ldx #80
	lda #0
cl1
	sta status,x
	dex
	bne cl1
	rts
;
; Inbuffer Size
; Calc free ram. Must be executed first time this program 
; is started and every time the input buffer is cleared.
;
bsize .word 0

calcInbufferSize
	txa
	pha
	tya
	pha
	
	lda #0 
	sta bsize
	sta bsize+1

	lda ramtop					; Calc free ram from end of this binary up to ramtop
	sbc #>endOfPrgStartOfBuffer	; start page at end of this prg
	sta bsize+1
	
	pla
	tay
	pla
	tax	
	
	rts	
;
; Shows current buffer size
;	
displayInbufferSize
	txa
	pha
	tya
	pha
	
	lda bsize
	sta fro1
	lda bsize+1
	sta fro2
	lda #<(inBufferTitel+24)
	sta zp
	lda #>(inBufferTitel+24)
	sta zp+1
	jsr toAscii
	
	pla
	tay
	pla
	tax	
	
	rts
	
;
; Add a lines to the in- buffer
;
; linesToEnter contains the number of lines.
;
; Result: ZP8 points to last empty line in
; the in- buffer. Number of lines is increased.
;
; Every routine writing to the in- buffer must
; call this subroutine to adjust the pointer  
; to the first free line insinde the in- buffer
;
; When the inbuffer is cleared, zp8 has to be reset to 
; the beginning of the inbuffer....
;
totalNumberOfLines
	.word 0
linesToAdd
	.byte 0

addLine
	txa
	pha
	tya
	pha
	
	ldx linesToAdd
add
	clc
	lda zp8
	adc#40
	sta zp8
	lda zp8+1
	adc#0
	sta zp8+1
	
	clc
	lda totalNumberOfLines
	adc #1
	sta totalNumberOfLines
	lda totalNumberOfLines+1
	adc #0
	sta totalNumberOfLines+1

	lda totalNumberOfLines		; More lines? if so, scroll
	cmp #16						; screen up by one line....
	bcs greater
	jmp ot	
greater
	clc
	lda inBufferAdr	
	adc #40
	sta inBufferAdr
	lda inBufferAdr+1
	adc #0
	sta inBufferAdr+1
ot
	sec						; Refresh input buffer size
	lda bsize
	sbc #linesize
	sta bsize
	lda bsize+1
	sbc #0
	sta bsize+1
	jsr displayInbufferSize
	
	dex
	bne add
	
	pla
	tay
	pla
	tax	
	
	rts
;
; Clear inputbuffer
;
clearInBuffer
	txa
	pha
	tya
	pha
	
	lda #<inbuffer
	sta zp
	lda #>inBuffer
	sta zp+1
	ldx #>inbuffer			; Number of pages to be cleared
	lda #0
l	
	ldy #0
ll
	sta (zp),y
	iny
	bne ll
	clc
	inc zp+1
	dex
	bne l
		
	lda #<inbuffer	 		; Reset pointer to
	sta zp8					; inpuffer
	sta inbufferAdr			; and scroll display to the top
	lda #>inBuffer
	sta zp8+1
	sta inBufferAdr+1
	jsr calcInbufferSize	; Recalc size and
	jsr displayInBufferSize	; display
	lda #0					; Reset number of lines
	sta totalNumberOfLines
	
	pla
	tay
	pla
	tax	
	
	rts
;
; Send
; Sends the contents of the inputbuffer (the line entered
; inside the commandline) via
; porta/portb to the connected hardware
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
	pla
	tay
	pla
	tax	
	rts
;
; User did input a command, evaluate!!
;
evaluateCommand
	txa
	pha
	tya
	pha
	
	lda inputBuffer+1
	
	cmp #'D'
	bne notDir
	sta device				; Init device name + # (Dn)....
	lda inputBuffer+2
	sta device+1
	jsr readDir
	jmp o
notDir
	cmp #'C'
	bne noComm
	jsr clearInBuffer
	jsr print_input_buffer_empty
	jmp o
noComm
	jsr print_help
o
	pla
	tay
	pla
	tax	
	
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
	sec
	sbc #32				; From atascii to internal (value that can be 'poked' on the screen
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
;
print 
	ldx #0      	; iocb #0
  	sta icbal,x   
  	tya           
  	sta icbah,x   
  	lda #80       
  	sta icball,x
  	lda #0
  	sta icbalh,x  
  	lda #9          ; command 'put text'
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
; Read disk directory into the input- buffer
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
  	
  	lda #0
  	sta linesToAdd
l1
  	ldx #$20	
  	lda #255		; Max size of dir file....
  	sta icball,x	; 64 x  (8+3) bytes per. dir entry..
  	lda #3
  	sta icbalh,x
	lda #5			; Get record
  	sta iccom,x
  	jsr ciov   
  	bmi dirRead
  	jsr print_dir	; Write line just read into the in- buffer
	inc linesToAdd
  	jmp l1			; Read until all enries read....
  	
dirRead
	jsr cioClose
	jsr addLine
 	rts
 	
device
	.byte 0,0		; Device and # (D2, D1.....)
 	.byte ':*.*'
 	
;
; Close a CIO Cannel
;
cioClose
	ldx #$20
	lda #12			; Close
  	sta iccom,x
  	jsr ciov   
  	bmi cioError
  	rts
;
; Prints cio error
;
cioError
 	jsr print_cio_error
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
	
print_input_buffer_empty
	lda #<status
	sta 88
	lda #>status
	sta 89
	lda #<text_buffer_cleared
	ldy #>text_buffer_cleared
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
	lda zp8
	sta 88
	lda zp8+1
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
; Firmware
;
	icl 'Parallel_Interface_Firmware.asm'	
;
; Data
;

null
	.byte ' ',lf

titel
	.byte "MINI TERM V1.89 BF                      "
	
statusTitel
	.byte "STATUS:                                 "
	
commandLineTitel
	.byte "SHELL:                                  "
status
:120 .byte 0

text_sending
	.byte 'Sending:'	
echoOfCommand
:40	.byte 0
	.byte 0
	
inBufferTitel
	.byte "BUFFER:                       Bytes free"	
	
text_time_out_err
	.byte 'Time out error!                         ',lf
text_success
	.byte 'Bytes send successfully:                ',lf
text_no_input
	.byte 'No input, nothing send.....             ',lf
text_help
	.byte 'Type: !D(ir)/C(lear)                    ',lf
	
text_cio_error
	.byte 'CIO Error:'
	.byte '                              ',lf
	
text_buffer_cleared
	.byte 'In buffer empty                         ',lf

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

	.byte $40+$02 
inBufferAdr
	.byte a(inBuffer)
	
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
:768	.byte 0

endOfPrgStartOfBuffer
		.byte 0

blank
:700	.byte '.'	; Well, seems some OS routine is using this space?

inBuffer			; All data received is written into this area....
		.byte 0		
	
