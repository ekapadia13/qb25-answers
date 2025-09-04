#!/usr/bin/env python3
import sys
import fasta

my_file = open(sys.argv[1])
contigs = fasta.FASTAReader(my_file)

ident_count = 0
length_total = 0
for ident, sequence in contigs:
    ident_count += 1
    length = len(sequence)
    length_total += length

average = length_total / ident_count

#print(ident_count)
#print(length_total)
#print(average)


print(f"Number of contigs: {ident_count} , Total Length: {length_total} , Average Length: {average}")