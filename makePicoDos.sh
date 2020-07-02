# Gets all Xex Files from 'bin' folder and
# creates - using 'dir2atr' - an valid '*.atr' image which
# contains these files as valid Atari binary files on an 'MyPicoDos'
# formated disk which boots.

dir2atr -b MyPicoDos405 ptools.atr bin
