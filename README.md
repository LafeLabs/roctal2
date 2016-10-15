# Roctal  \m/

ROctal is a system for encoding data using a combination of binary and octal to make the product as readable as possible both for a human and a machine.  It is a geometric system for encoding data, independent of the medium in which the geometry is printed.  Media which this is designed for include:

 - ink on paper printed with printer
 - transmission from one computer device to another via screen-to-camera link
 - carved stone, metal, brick
 - metal(gold) deposited on silicon
 - electrochemical patterning on the native oxide of aluminum, then coating with polymer
 - farmers' fields for readability from space cameras
 - marker on paper, by hand or by robot
 - laser cutting
 - electron beam lithography, optical lithography etc.
 
 The purpose of this code is to connect information with physical objects and with the human mind with as close a link as possible.  For implementation in current technology the best way to use it is as an app for a mobile device like a tablet, smart phone or embedded system, which integrates a camera or other transducer into software that creates human-interpretable or machine-interpretable code.  
 
 Some of the information which might be encoded this way includes:
 
 - encoding of .stl file which created a physical thing printed from 3d printer
 - recording and playback of music and other sounds without connection to the "Tech" Enemy
 - recording data for very long term storage to survive nuclear wars, many millennia, etc.
 - communication with perfect secrecy using one time pads generated with physical quantum noise generators and directly encoded into the physical artifact, then read out without a network connection, again with freedom from the "Tech" Enemy
 - A free and more readable and more scalable replacement for QR codes and their ilk
 - assembly code instructions on physical components of a system, describing both the component and the operation required to connect it to the rest of the system
 - encoding the history of an artifact on that artifact(the Tale)
 - encoding detailed instructions on how to build an artifact(The Lore)
  
 
## Format
 
 Each 8 bit byte is represented as a subset of a 4x4 grid of squares some of which are full and some of which are empty(where "full and "empty" have different meanings depending on the implementation).  The upper left hand corner is always full and the one down and to the right of it is always empty.  Together, these form a calibration pair to find 1 and 0 as the scanner tool(be that software or hardware) travels around. The three to the right of that are used for various annotations, and the three below it represent base 8 digits in one way or another. Both this row of 3 and this column of 3 become alignment marks, colored in with a separate "color" than the 1's or 0's at high densities of data for ease of both human and machine readout.
 
 
 8 bit binary integer:
 
 0b ABCDEFGH
  
|1|4's|2's|1's|
|-|-|-|-|
|64's|0|A|B|
|8's|C|D|E|
|1's|F|G|H|

 

By default, everything is in 7 bit ASCII code.  The beginning of every document is always in this format and describes in clear non technical English what the rest of the file is.  This can still have any other languages script, but there must be an English preamble to describe which script is used first in order to stay within 7 bit ASCII reliably.  It could be as simple as the text "WHAT FOLLOWS IS UNICODE" followed by everything in some other script using unicode.  

Formatting the preamble file in json is not needed but is probably a good idea in many cases, especially for the Shape Code described below.   
 
## Shape Code
 
 The shape code of any given physical thing is determined in the encoding described here, and may be unique to that thing.  By default the header information encoded in a thing will be, if it's not 7 bit ASCII, a 7 bit shape code which sets the most significant bit of the 8 bit byte to 1 instead of 0 as it is for ASCII.  
 
 These codes can link to physical things, examples of operations based on how things go together, reservoirs of some material such as a metal or organic object like a stick.  
 
 code elements might include such things as:
 
 - find thick corrugated cardboard box in trash
 - cut 3 inch equilateral triangle out of box
 - add code to triangle
 - apply electrochemical potential to move 1 mg of aluminum
 - shrink by 2x
 - move by N X side, where side is the length of one side of a shape
 - carve shape out of brick with impact tool
 
## Implementations
 
 The first implementation is in the language Processing, found at processing.org, and is designed to make images on a screen of one device which can be read by the camera of another, transferring data by way of camera/screen.  The processing directory of this repository is full of my crude attempts to implement this and is still very much a work in progress. 


## INTELLECTUAL PROPERTY NOTICE



ALL WORK CREATED HERE IS THE PRODUCT OF A PERSON OR PEOPLE WHO DO NOT RECOGNIZE THE VALIDITY OF ANY INTELLECTUAL PROPERTY OR INDEED ANY OTHER PROPERTY LAW.  NO RESTRICTIONS BASED ON SUCH LAW ARE HERE DECLARED OR RECOGNIZED.  ALL USE BY ANYONE WITHOUT ANY RESTRICTION INCLUDING FOR COMMERCIAL PURPOSES IS ALLOWED, SINCE NO LAW IS REFERENCED AT ALL IN THIS DOCUMENT.  THIS IS A SELF-ANNULLING DOCUMENT, IN THAT IT IS INTENDED TO CARRY NO LEGAL WEIGHT AND TO SERVE AS A SUBSTITUTE FOR A LEGAL DECLARATION AND A NEGATION OF ANY POTENTIAL LEGAL CLAIMS.  NO LIABILITY BASED ON CREATIONS HEREIN ARE RECOGNIZED BY THE AUTHOR. NO LAW OF ANY KIND IS RECOGNIZED BY THE AUTHOR.

NO PATENTS

NO COPYRIGHTS

NO LAWS

NO MONEY

NO MINING





