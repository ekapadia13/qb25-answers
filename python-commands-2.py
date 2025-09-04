#!/usr/bin/env python3

import sys
my_file = open(sys.argv[1])

_ = my_file.readline()
_ = my_file.readline()

header = my_file.readline().rstrip().split("\t")
data_line = my_file.readline().rstrip().split("\t")

#print(header)
#print(data_line)

dictionary = {}
#for i in data_line: