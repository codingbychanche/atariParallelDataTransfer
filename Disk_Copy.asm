; Disk Copy
;
; Reads an Atari Disk and sends it to
; the parallel interface
;
; BF 2019
;

; ANTIC

DLPTR	EQU 560	
VDLIST	EQU $200	 
NMIEN	EQU $D40E
WSYNC	EQU $D40A
VCOUNT	EQU $D40B
RTCLK	EQU $14
SDMCTL	EQU 559

; COLORS

COLPF0	EQU 708  
COLPF1	EQU 709 
COLPF2	EQU 710
COLPF3	EQU 711
COLBAK	EQU 712

COLPF0S	EQU $D016 
COLPF1S	EQU $D017
COLPF2S	EQU $D018
COLPF3S	EQU $D019
COLBAKS	EQU $D01A

; DISK I/O

DSKINV	EQU $E453  
DSKCMD	EQU $302	  
DSKAUX1	EQU $30A      
DSKDEV	EQU $300   
DSKUNIT	EQU $301	  
DSKBY	EQU $308   
DSKBUFF	EQU $304   
DSKTMOT	EQU $306 

; PM GRAFIK

PMADR	EQU $B800 
PMCNTL	EQU $D01D 

HPOSP0	EQU $D000 
HPOSP1	EQU $D001
HPOSP2	EQU $D002
HPOSP3	EQU $D003

SIZEP0	EQU $D008 
SIZEP1	EQU $D009
SIZEP2	EQU $D00A
SIZEP3	EQU $D00B

COLPM0	EQU 704   
COLPM1	EQU 705
COLPM2	EQU 706
COLPM3	EQU 707

PMBASE	EQU $D407

GRACTL	EQU $D01D 

; Zeropage

ZP		equ $e0
zp2		equ $e2
zp3		equ $e4
zp4		equ $e6
zp5		equ	$e8
zp6		equ $ea
zp7		equ $ec
zp8		equ $ee

;
; Start
;
;
; Memory usage:
; -------------
;
; Basics: Free Ram starting from $c000 towards memlow: $6a(106)*256
; OS fills Ram startin from $1000 to memtop (e.g. Screen starts from $1000 upwards).
;
; Free Ram:
; $1000 - $C000 With no DOS and Basic installed
;

	org $1000
start
	lda #<screen				; Antic PRG
	sta DLPTR
	lda #>screen
	sta DLPTR+1
	
	jsr press_start				; Press start to copy....
	jsr clear_message			; No message yet

	jsr read_sector
	
e
	jmp e

;
; Read sector
;

read_sector
	lda #<sector_data
 	sta dskbuff
 	lda #>sector_data
	sta dskbuff+1
	
	lda #1
	sta dskunit
        
 	lda #'R'
 	sta dskcmd
 	lda #<361
 	sta dskaux1
	lda #>361
	sta dskaux1+1

	jsr dskinv
	bmi error
	rts

error
	jsr disk_access_err
	rts
	

;
; End
;



;
; Sub's for displaying status messages
;

press_start
	lda #<pressstart
	sta status_message
	lda #>pressstart
	sta status_message+1

	rts
	
;
; Sub's for displaying messages
;

clear_message
	lda #<empty
	sta message
	lda #>empty
	sta message+1

	rts
	
disk_access_err
	lda #<disk_error
	sta message
	lda #>disk_error
	sta message+1

	rts
	

;	
; Status and error messages
;

empty
	.byte "OK                                      "
sending
	.byte "Sending............                     "
pressstart
	.byte "Press <START> to copy disk in drive #1  "
sucess
	.byte "All data send, no error's               "
time_out
	.byte "Time out error, check connection!       "
disk_error
	.byte "Disk error, check drive......           "
	
;
; Display list
; 	

gr0				equ $02	; gfx basic mode 2
gr6				equ $06	; gfx basic mode 6
gr7				equ $07	; gfx basic mode 7

lines_general	equ 10	; # of lines for general purpose screen
lines_sec_dat	equ 6	; # of lines of screen area where contents of current sector are displayed	

screen						 	
				.byte 112				
				.byte $40+gr7,a(screenram)
	
				.byte $40+gr0
message			.byte 0,0
				.byte 0

				.byte $40+gr0
status_message	.byte 0,0
				.byte 0
	
				.byte $40+gr0,a(screenram_general)
:lines_general 	.byte $02

				.byte $40+gr6,a(sector_title)
				.byte $40+gr0,a(sector_data)
:lines_sec_dat	.byte gr0

				.byte 112
				.byte $41,a(screen)								; End of Antic prg.

;
; Screen Ram
;
	
screenram
				.byte "disk copy            "
				.byte "                                        " ; status_message
				.byte "                                        " ; message
screenram_general
:lines_general	.byte "                                        " ; start of screen ram for general purpose

sector_title
				.byte "sector data          "
sector_data
:lines_sec_dat	.byte "                                        " ; Ccontets of current sector are displayed here

end																 ; End adress of binary (used for calculating size).
	nop
	