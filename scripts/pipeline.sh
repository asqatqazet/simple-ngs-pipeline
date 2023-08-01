#!/bin/bash

SECONDS=0

# change working directory
cd /Users/asihati.hazaiti/ngs


#reference the data folder name and sra numbers from static variable.
readonly DATA_FOLDER=genome/SRR23683396
readonly SRA_NUMBER=SRR23683396



# STEP 1: Run fastqc
fastqc $DATA_FOLDER/$SRA_NUMBER.fastq -o $DATA_FOLDER


# optiaonally run trimmomatic to trim reads with poor quality
java -jar trimmomatic/trimmomatic.jar SE -threads 4 $DATA_FOLDER/$SRA_NUMBER.fastq $DATA_FOLDER/$SRA_NUMBER-trimmed.fastq TRAILING:10 -phred33

# if you've  chosen to run trimmomatic, re-run fastqc to check whether the quality imporved.
fastqc $DATA_FOLDER/$SRA_NUMBER-trimmed.fastq -o $DATA_FOLDER


# STEP 2: Run HISAT2
# mkdir HISAT2
# get the genome indices

wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz



# run hisat2 to align genome to downloaded reference genome and sort with samtools.
hisat2 -q   -x HISAT2/grch38/genome -U data/$SRA_NUMBER.fastq | samtools sort -o HISAT2/$SRA_NUMBER.bam
echo "HISAT2 finished running."



duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."