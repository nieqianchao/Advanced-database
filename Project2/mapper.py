#!/usr/bin/env python
import sys

for inputline in sys.stdin:
    inputline=inputline.strip()
    inputline=inputline.split(',')
    if len(inputline[1])>=10:
        if (inputline[3]=='5'):
            print '%s\t%s,%s' % (inputline[0],'c',inputline[1])
    else:
        print '%s\t%s,%s' % (inputline[1],'t','1')
