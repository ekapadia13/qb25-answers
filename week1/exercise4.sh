bedtools intersect -a hg19-kc.bed -b snps-chr1.bed -c > snp_amount | sort -k 5 -nr | head
# chr1	245912648	246670581	ENST00000490107.6_7	5445
# Systematic Name = ENST00000490107.6_7
# Human Readable Name = SMYD3
# Position = hg19 chr1:245,912,865-246,670,519
# Size = 757,655
# Exon Count = 12
# This is an extremely large gene. It is over 750,000 bp long, with 12 exons. This means there is lots of space for SNPs to occur, probably accounting for the amount of SNPs we see

bedtools sample -i snps-chr1.bed -n 20 -seed 42 > snp_subset 
bedtools sort -i snp_subset > snp_subset_sorted
bedtools sort -i hg19-kc.bed > hg19-kc_sorted.bed
bedtools closest -a snp_subset_sorted -b hg19-kc_sorted.bed -d -t first > in_out
# There are 15 inside the gene
# The range is 1,664-22,944 bq outside the gene

