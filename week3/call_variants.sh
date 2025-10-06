#!/bin/bash

tar -xzvf BYxRM_bam.tar.gz       

samtools index -M *.bam #anything that is .bam will be indexed

# Generating a list of how many aligned reads each bam file contains
for sample in *.bam
do
    samtools view -c $sample
done > read_counts.txt

# Generating a list with the file names of each bam file
for sample in *.bam
do
    echo $sample
done > bamListFile.txt

# Looking at differences between my samples and the reference (yeast) genome
freebayes -f /Users/cmdb/qb25-answers/week2/genomes/sacCer3.fa --genotype-qualities -L bamListFile.txt -p 1 > unfiltered.vcf