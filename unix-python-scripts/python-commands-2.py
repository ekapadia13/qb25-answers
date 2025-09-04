#!/usr/bin/env python3

import sys
my_file = open(sys.argv[1])

_ = my_file.readline()
_ = my_file.readline()

header_line = my_file.readline().rstrip().split("\t")
data_line = my_file.readline().rstrip().split("\t")

#print(header)
#print(data_line)

dictionary = {} #header[i] is key & data[i] = value
for i in range(len(header_line)):
  #  header = header_line[i]
  #  data = data_line[i]
    dictionary[header_line[i]] = data_line[i]

my_file_2 = open(sys.argv[2])
for line in my_file_2:
    fields = line.rstrip().split("\t")
    
    SAMPID = fields[0]
    SMTSD = fields[6]

    if SAMPID in dictionary:
        print(f"{SAMPID} \t {data_line[i]} \t {SMTSD} \n")

# GTEX-1117F-0226-SM-5GZZ7 	 0.02522 	 Adipose - Subcutaneous 
# GTEX-1117F-0426-SM-5EGHI 	 0.02522 	 Muscle - Skeletal 
# GTEX-1117F-0526-SM-5EGHJ 	 0.02522 	 Artery - Tibial 


