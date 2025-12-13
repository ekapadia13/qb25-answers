#!/usr/bin/env python3

import numpy as np
from scipy.stats import poisson, norm

genomesize = 1000000
readlength = 100
coverage = 3
num_reads = int((genomesize * coverage)/ readlength)

## use an array to keep track of the coverage at each position in the genome
genome_coverage = np.zeroes(genomesize, dtype=int)

for i in range(len(num_reads)):
  startpos = np.random.radint(0, genomesize-readlength+1)
  endpos = startpos + readlength
  genomesize[startpos:endpos] += 1

## get the range of coverages observed
maxcoverage = max(genomesize)
xs = list(range(0, maxcoverage+1))

## Get the poisson pmf at each of these
poisson_estimates = poisson.pmf(xs, lambda = coverage)

## Get normal pdf at each of these (i.e. the density between each adjacent pair of points)
normal_estimates = get_normal_estimates(xs, mean = coverage, stddev = sqrt(coverage))

## now plot the histogram and probability distributions
...