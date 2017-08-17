#!/usr/bin/env python

import subprocess as sp
import re
import sys

if len(sys.argv) != 4:
    raise Exception("Not enough arguments")

myds9=sys.argv[1]
line=sys.argv[2]
gap=sys.argv[3]


cmd="xpaget {0} regions selected -format ds9".format( myds9 )
pss = sp.Popen( cmd, shell=True, stdout=sp.PIPE)
_msg = pss.communicate()
msg=_msg[0].split("\n")


# Skip the header lines.  
for ii,hh in enumerate(msg):
    if hh.startswith("global "):
        break

hl = ii+1
hdr=msg[0:hl]



for ll in msg[hl:]:
    if ll.count("#") == 0:
        cmt = " # " 
    else:
        cmt = " "
        
    if ll.count("dash=") == 0:
        cmt += " dash=1 " 
    ll += cmt
    m = re.search( r"dashlist=\d+ \d+", ll )    
    if None == m:
        ll += " dashlist={0} {1}".format( line, gap )
    else:
        ll=ll.replace( m.group(0), "dashlist={0} {1}".format(line,gap))
    hdr.append(ll)


oo = "\n".join(hdr)


cmd2 = "xpaset -p {0} regions delete select".format(myds9)
ps2 = sp.Popen( cmd2, shell=True )
ps2.communicate()

cmd2 = "xpaset {0} regions".format(myds9)
ps2 = sp.Popen( cmd2, shell=True, stdin=sp.PIPE )
ps2.communicate( oo )

    
