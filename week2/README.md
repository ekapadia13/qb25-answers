# WEEK 2 ASSIGNMENTS #

# Exercise 1:
bowtie2 -p 4 -x ../genomes/sacCer3 -U ~/Data/BYxRM/fastq/A01_01.fq.gz > A01_01.sam
samtools sort -o A01_01.bam A01_01.sam  
samtools index A01_01.bam  
samtools idxstats ~/qb25-answers/week2/variants/A01_01.bam > A01_01.idxstats

# Exercise 2:
When looking in igv, it seems that samples 2, 5, and 6 have similar visualization, and samples 1, 3, and 4 h 1 have similar visualizations. This makes sense when looking at the hapotype data in BYxRM_GenoData.txt, which show that samples 1, 3 and 4 are haplotype R, and samples 2, 5, and 6 are haplotype B