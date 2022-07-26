#To Update the systems packages
sudo apt-get update

#To install Miniconda
sudo apt-get install bzip2

#To download miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

#To run the shell script
bash Miniconda3-latest-Linux-x86_64.sh

#To remove the shell script after installation, this is done in order to free up memory
rm Miniconda3-latest-Linux-x86_64.sh

#To reinitialize the shell inorder to recongise the shell command
source .bashrc

#Install seqtk
conda install -c bioconda seqtk

#Install samtools
conda install -c bioconda samtools

#Install fastp
conda install -c bioconda fastp

#Install star
conda install -c bioconda star

#Install Qualimap
conda install -c bioconda qualimap

#Install HTSEQ
conda install -c bioconda htseq

#Creating a Download directory for the downloads files.
mkdir Downloads

#Listing the directory in the terminal
ls

#Navigating to the download directory
cd Downloads

#Downloaded one file from Github
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/SRR1552451.fastq.gz

#Downloaded another file from Github
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/SRR1552452.fastq.gz

Downloaded the third file from Github
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/SRR1552453.fastq.gz

#List the files in the Download directory
ls

#To Ascertain the format of the downloaded files
file SRR1552451.fastq.gz  SRR1552452.fastq.gz  SRR1552453.fastq.gz

#Back to home
cd ../

#fastop directory was created
mkdir fastop

#Creating the Output directory for all results
mkdir output

#Navigated to the fastop directory
cd fastop

#Navigating back to home
cd ../

#Activate conda environment
conda activate

#Install fastqc
conda install -c bioconda fastqc

Navigated to the fastop directory
cd fastop

#Run fastqc
fastqc

#To run fastqc on the first file
fastqc ../Downloads/SRR1552451.fastq.gz

#Sending the results to the output directort
fastqc ../Downloads/SRR1552451.fastq.gz --outdir=../output

#Navigate to the output directory
cd ../output

#Printing the content of the output
ls

#Unzip the zipped file
unzip SRR1552451_fastqc.zip

#Printing the content of the output
ls

#Opening the unzipped folder
cd SRR1552451_fastqc

#Printing the content
ls

#Checking our results in the summary file
cat summary.txt
