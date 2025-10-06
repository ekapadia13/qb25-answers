#!/usr/bin/env python3
import sys

my_file = open(sys.argv[1])

af_list = []
dp_list = []

for line in my_file:
    if line.startswith('#'):
        continue
    fields = line.rstrip('\n').split('\t')
    info = fields[7]
    info_columns = info.rstrip('\n').split(';')
    af = info_columns[3]
    af = af.strip('AF=')
    af_list.append(af)

    sample1 = fields[9].rstrip('\n').split(":")
    sample2 = fields[10].rstrip('\n').split(":")
    sample3 = fields[11].rstrip('\n').split(":")
    sample4 = fields[12].rstrip('\n').split(":")
    sample5 = fields[13].rstrip('\n').split(":")
    sample6 = fields[14].rstrip('\n').split(":")
    sample7 = fields[15].rstrip('\n').split(":")
    sample8 = fields[16].rstrip('\n').split(":")
    sample9 = fields[17].rstrip('\n').split(":")
    sample10 = fields[18].rstrip('\n').split(":")

    sample1 = sample1[2]
    dp_list.append(sample1)
    sample2 = sample2[2]
    dp_list.append(sample2)
    sample3 = sample3[2]
    dp_list.append(sample3)
    sample4 = sample4[2]
    dp_list.append(sample4)
    sample5 = sample5[2]
    dp_list.append(sample5)
    sample6 = sample6[2]
    dp_list.append(sample6)
    sample7 = sample7[2]
    dp_list.append(sample7)
    sample8 = sample8[2]
    dp_list.append(sample8)
    sample9 = sample9[2]
    dp_list.append(sample9)
    sample10 = sample10[2]
    dp_list.append(sample10)

    # grab what you need from `fields`

with open('AF.txt', 'w') as outfile:
    outfile.write("AF\n") #creates the header line
    for af in af_list: #loops through your list
        outfile.write(f"{af}\n") #writes each item and a new line

with open('DP.txt', 'w') as outfile:
    outfile.write("DP\n")
    for dp in dp_list:
        outfile.write(f"{dp}\n")

my_file.close()
