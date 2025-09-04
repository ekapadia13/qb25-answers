#!/usr/bin/env python3
import sys
import fasta

my_file = open(sys.argv[1])
contigs = fasta.FASTAReader(my_file)

contig_length = []

ident_count = 0
length_total = 0
for ident, sequence in contigs:
    ident_count += 1
    length = len(sequence)
    length_total += length

    contig_length.append(length)
    contig_length.sort(reverse = True)

average = length_total / ident_count

contig_count = 0
length_half = length_total / 2
for contig in contig_length:
    contig_count += contig
    if contig_count >= length_half:
        break

#print(ident_count)
#print(length_total)
#print(average)
#print(contig_length)

print(f"Number of contigs: {ident_count} , Total Length: {length_total} , Average Length: {average}")
print(f"{contig} is the sequence length of the shortest contig at 50% of the total assembly length")