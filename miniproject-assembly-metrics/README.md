# My Project: Assembling c. remanei genomes

- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248909/caenorhabditis_remanei.PRJNA248909.WBPS19.genomic.fa.gz
    - file size = 115M
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA248911/caenorhabditis_remanei.PRJNA248911.WBPS19.genomic.fa.gz
    - file size = 121M
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA53967/caenorhabditis_remanei.PRJNA53967.WBPS19.genomic.fa.gz
    - file size = 141M
- https://ftp.ebi.ac.uk/pub/databases/wormbase/parasite/releases/WBPS19/species/caenorhabditis_remanei/PRJNA577507/caenorhabditis_remanei.PRJNA577507.WBPS19.genomic.fa.gz
    - file size = 127M

## Instructions:
1) Download https://raw.githubusercontent.com/bxlab/cmdb-quantbio/refs/heads/main/resources/code/fasta.py to your directory using wget
2) Download all the c. remanei assemblies to your directory using wget
2) On terminal: chmod +x assembly-metrics.py
2) Run your script using ./[script name] [c.remanei genome] for each of the 4 assemblies

## Results Summary:
1) Number of contigs: 1591 , Total Length: 118549266 , Average Length: 74512.42363293526 
1522088 is the sequence length of the shortest contig at 50% of the total assembly length
2) Number of contigs: 912 , Total Length: 124541912 , Average Length: 136559.11403508772 
1765890 is the sequence length of the shortest contig at 50% of the total assembly length
3) Number of contigs: 3670 , Total Length: 145442736 , Average Length: 39630.17329700272 
435512 is the sequence length of the shortest contig at 50% of the total assembly length
4) Number of contigs: 187 , Total Length: 130480874 , Average Length: 697758.6844919786 
21501900 is the sequence length of the shortest contig at 50% of the total assembly length