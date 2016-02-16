#!/usr/bin/env python
from operator import itemgetter
import sys
import re

current_name=None
current_custID=0
current_trans=0
cust_info={}

for inputline in sys.stdin:
    inputline=inputline.strip()
    inputline=re.split('[\t,]',inputline)    
    if current_custID==inputline[0]:
    
        if inputline[1]=='c':        
            current_name=inputline[2]
            cust_info[current_custID]=current_name
        
        elif inputline[1]=='t':        
            current_trans+=int(inputline[2])
    else:
        try:
            if(cust_info[current_custID]):
                print '%s\t%s,%s' % (current_custID,cust_info[current_custID],str(current_trans))
        except:
            pass
        current_custID=inputline[0]
        if inputline[1]=='c':        
            current_name=inputline[2]
            cust_info[current_custID]=current_name        
        elif inputline[1]=='t':        
            current_trans=int(inputline[2])
