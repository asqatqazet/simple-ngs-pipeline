## NGS Analysis Pipeline

## Installation of Tools

Before running the data analysis pipeline, we need to install the following tools:

1. **fastqc**: A quality control tool for high-throughput sequence data.

   - Mac: Install using Homebrew - `brew install fastqc`

2. **trimmomatic**: A tool for trimming and filtering raw sequencing data.

   - Download from: [Trimmomatic Website](http://www.usadellab.org/cms/?page=trimmomatic)

3. **hisat2**: A fast and sensitive alignment program for mapping next-generation sequencing reads to a reference genome.

   - Download from: [Hisat2 Website](http://daehwankimlab.github.io/hisat2/download/#version-hisat2-221)

4. **sra toolkit**: A suite of tools for accessing and working with data in the Sequence Read Archive (SRA).

   - Install according to instructions from: [SRA Toolkit GitHub](https://github.com/ncbi/sra-tools)
5. **sam toolkit**:  Reading/writing/editing/indexing/viewing SAM/BAM/CRAM format
    - Download from: [Sam Toolkit](http://www.htslib.org/)

## Prepare Data

To use the data analysis pipeline, follow these steps to download and prepare the data:

1. Go to the NCBI SRA website: [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra/) and find the datasets of interest.

2. Download the data in SRA format. For example, if the accession number is `SRR23683396`, you can download it using the following command in the directory where you want to store the data:

   ```bash
   prefetch SRR23683396

   fastq_dump  SRR23683396.sra



## Running Pipeline: 

Finally,  adjust the variable names and the commands in the script, and run

```bash 

./scripts/pipeplie.sh
