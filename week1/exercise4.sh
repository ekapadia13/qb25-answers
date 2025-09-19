bedtools intersect -a hg19-kc.bed -b snps-chr1.bed -c > snp_amount | sort -k5,5nr | head
# chr1	245912648	246670581	ENST00000490107.6_7	5445
# Systematic Name = ENSG00000226876.4_13 or ENST00000651181.1_1 (gene vs trancript name)
# Human Readable Name = SMYD3-AS1
# Position = hg19 chr1:246,271,939-246,277,106
# Size = 5,168
# Exon Count = 5 
# I think this gene has the most SNPs because .........................

bedtools sample -i snp_amount -n 20 -seed 42 > snp_subset 
bedtools sort -i snp_subset > snp_subset_sorted
bedtools sort -i hg19-kc.bed > hg19-kc_sorted.bed
bedtools closest -a snp_subset_sorted -b hg19_kc_sorted_sorted -d -t first > in_out               
#they are all inside the gene


