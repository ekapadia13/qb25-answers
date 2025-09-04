#!/usr/bin/env python3

import sys
my_file = open(sys.argv[1])

for line in my_file:
    column = line.rstrip().split("\t")
    sample = column[3]
    chrom = column[0]

    score = int(column[4])
    strand = column[5]

    end = int(column[2])
    start = int(column[1])
    size = end - start
    
    new_score = score * size
    if strand == "-":
        new_score *= -1

    print(chrom + "\t" + str(start) + "\t" + str(end) + "\t" + sample + "\t" + str(new_score) + "\t" + strand)