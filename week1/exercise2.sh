# Calculate Genes Hg19
wc hg19-kc.bed
# Answer = 80,270

# Unique Hg19 Genes
bedtools intersect -a hg19-kc.bed -b hg16-kc.bed -v > hg19_unique.bed
# Answer = 42,717

#Hg19 is a newer assembly than Hg16, which means it has more information than older assemblies may have had. Therefore, more genes will appear in Hg19 than Hg16

# Calculate Genes in Hg16
wc hg16-kc.bed
# Answer = 21,365

# Unique Hg16 Genes
bedtools intersect -a hg16-kc.bed -b hg19-kc.bed -v > hg16_unique.bed
# Answer = 3,460

#Hg16 is older. Therefore, you could have instances such as people thinking alleles of a gene or portions of the same gene were actually different genes. By Hg19, they were realized as only one gene. This could be why we see the difference. Additionally, if you had alternatively spliced transcripts which were used to create the assembly, people may have thought those to be separate genes instead of spliced transcripts of the same gene