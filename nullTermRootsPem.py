#!/usr/bin/env python

import sys;

certsData = open("data/roots.pem", "rb").read()

# calculate the output binary size, app offset 
outputSize = 0x20000 
outputData = bytearray(b'\xff') * outputSize

for i in range(0, len(certsData)):
        outputData[i] = certsData[i]

# zero terminate the pem file
outputData[len(certsData)] = 0

outputFilename = "binaries/roots.bin"
if (len(sys.argv) > 1):
	outputFilename = sys.argv[1]

# write out
with open(outputFilename,"w+b") as f:
	f.seek(0)
	f.write(outputData)
