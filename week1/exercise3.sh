bedtools intersect -a nhek-active.bed -b nhek-repressed.bed > nhek_overlap
# output = 0
bedtools intersect -a nhlf-active.bed -b nhlf-repressed.bed > nhlf_overlap
# output = 0

bedtools intersect -a nhek-active.bed -b nhlf-active.bed > nhek_nhlf_active
# there are 12,174 regions active in both nhek and nhlf
bedtools intersect -a nhek-active.bed -b nhlf-active.bed -v > nhek_not_nhlf
# there are 2,405 regions active in nhek that are repressed in nhlf
# there were 14,013 lines originally in nhek-active. 12,174 + 2,405 = 14,579. these numbers are not the same
bedtools intersect -a nhek-active.bed -b nhlf-active.bed -u > nhek_nhlf_active
# the new output is 11,608. When summed with 2,405, this equals 14,013, which matches!!!

bedtools intersect -a nhek-active.bed -b nhlf-active.bed -f 1 | head
bedtools intersect -a nhek-active.bed -b nhlf-active.bed -F 1 | head
bedtools intersect -a nhek-active.bed -b nhlf-active.bed -f 1 -F 1 | head
# in the first command, nhek is fully overlapped by nhlf, and the opposite is true for the second condition. for the third condition, they are the exact same length/overlap to each other

bedtools intersect -a nhek-active.bed -b nhlf-active.bed | head
# the chromatin states are all active promoters
bedtools intersect -a nhek-active.bed -b nhlf-repressed.bed | head
# the chromatin states are a mix of active and repressed promoters, with some poised promoters and enhancer/insulator regions
bedtools intersect -a nhek-repressed.bed -b nhlf-repressed.bed | head
# the chromatin states are about an equal mix of repressed promoters and heterochromatin