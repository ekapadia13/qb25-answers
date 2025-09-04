### QUESTION 1
#Explore ce11_genes.bed using Unix

# How many features (lines)?
(qb25) cmdb@QuantBio-18 unix-python-scripts % wc ce11_genes.bed
# There are 53935 features/lines

# How many features per chr?
(qb25) cmdb@QuantBio-18 unix-python-scripts % cut -f 1 ce11_genes.bed | sort | uniq -c
#5460 chrI
#6299 chrII
#4849 chrIII
#21418 chrIV
#  12 chrM
#9057 chrV
#6840 chrX

# How many features per strand?
(qb25) cmdb@QuantBio-18 unix-python-scripts % cut -f 6 ce11_genes.bed | sort | uniq -c 
#26626 -
#27309 +

### QUESTION 3
#Explore GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt using Unix

#Which three SMTSDs (Tissue Site Detail) have the most samples?
(qb25) cmdb@QuantBio-18 unix-python-scripts % cut -f 7 GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt | sort | uniq -c | sort | tail -n 3
#Whole Blood , Muscle - Skeleton , Lung

#How many lines have “RNA”?
(qb25) cmdb@QuantBio-18 unix-python-scripts % grep -c "RNA" GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt    
#20017

#How many lines do not have “RNA”?
(qb25) cmdb@QuantBio-18 unix-python-scripts % grep -vc "RNA" GTEx_Analysis_v8_Annotations_SampleAttributesDS.txt   
#2935

