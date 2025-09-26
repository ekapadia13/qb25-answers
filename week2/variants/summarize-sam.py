#!/usr/bin/env python3
import sys

my_file = open(sys.argv[1])

my_dict = {}
my_other_dict = {}

for line in my_file:
    if line.rstrip().startswith("@"):
        continue
    else:
        column = line.rstrip().split("\t")
        rname = column[2]
        if rname not in my_dict:
            my_dict[rname] = 1
        else:
            my_dict[rname] +=1    
        for row in column:
            if row.startswith("NM:i"):
                nm_value = int(row[5:])
                if nm_value not in my_other_dict:
                    my_other_dict[nm_value] = 1
                else: 
                    my_other_dict[nm_value] +=1

for count in sorted(my_dict.keys()):
    print(count, my_dict[count])

for nm in sorted(my_other_dict.keys()):
    print(nm, my_other_dict[nm])

my_file.close()