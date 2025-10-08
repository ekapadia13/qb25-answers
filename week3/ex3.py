#!/usr/bin/env python3
import sys

my_file = open(sys.argv[1])

# sample IDs (in order, corresponding to the VCF sample columns)
sample_ids = ["A01_62", "A01_39", "A01_63", "A01_35", "A01_31",
              "A01_27", "A01_24", "A01_23", "A01_11", "A01_09"]

print("sample_id""\t""chrom""\t""pos""\t""genotype")

# open the VCF file
for line in my_file:
    if line.startswith("#"):
        continue
    # split the line into fields by tab, then
    fields = line.rstrip('\n').split('\t')
    chrom = fields[0]
    pos = fields[1]
    # for each sample in sample_ids:
    # get the sample's data from fields[9], fields[10], ...
    for i in range(9,18):
        id = sample_ids[i-9]
        sample = fields[i].rstrip("\n").split(":")
        # genotypes are represented by the first value before ":" in that sample's data
         # if genotype is "0" then print "0"
         # if genotype is "1" then print "1"
         # otherwise skip
        if sample[0] == "0":
            print(f"{id}\t{chrom}\t{pos}\t{sample[0]}")
        elif sample[0] == "1":
            print(f"{id}\t{chrom}\t{pos}\t{sample[0]}")
        else:
            continue

my_file.close()