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

#Downloaded the third file from Github
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

#Navigated to the fastop directory
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

#Return back to home
cd ../../

#Navigating to fastop directory
cd fastop

#Run Fastqc
fastqc

#Run fastqc on the second file
fastqc ../Downloads/SRR1552452.fastq.gz

#Sending results to the output directory
fastqc ../Downloads/SRR1552452.fastq.gz --outdir=../output

#Navigating to the output directory
cd ../output

#Printing files in output directory
ls

#unzip the second file
unzip SRR1552452_fastqc.zip

#Printing out the files in output
ls

#Navigating to the unzipped second file
cd SRR1552452_fastqc

#Printing the files in the unzipped file
ls

#Check the result in the summary file
cat summary.txt

#Navigating back to the home directory
cd ../../

#Navigate to the fastop directory

cd fastop

#Run fastqc
fastqc

#Run fastqc on the third file
fastqc ../Downloads/SRR1552453.fastq.gz

#send results from the run to the output directory
fastqc ../Downloads/SRR1552453.fastq.gz --outdir=../output

#Navigating to the output directory
cd ../output

#listing the files in output
ls

#Unziping the third zipped file
unzip SRR1552453_fastqc.zip

#list the files in output
ls

#Navigating to the third unzipped file
cd SRR1552453_fastqc

#List files in the SRR1552453
ls

#checking the results in the summary
cat summary.txt

#Naviagting back to the home page
cd ../../

#Navigate to the Download directory
cd Downloads

#Download the reference genome
wget wget https://github.com/josoga2/yt-dataset/raw/main/dataset/raw_reads/reference.fasta

#Download Baxter.bam file
wget https://github.com/josoga2/yt-dataset/raw/main/dataset/alignment_map/Baxter.bam

#Download Chara.bam file
wget wget https://github.com/josoga2/yt-dataset/raw/main/dataset/alignment_map/Chara.bam

#Navigated to fastop
cd fastop

#Run samtools
samtools

#View the header of Baxter
samtools view -H ../Downloads/Baxter.bam

#To check if it has a PCR flag
samtools view -f 1024 ../Downloads/Baxter.bam

#To check the first 5 alignment
samtools view ../Downloads/Baxter.bam | head -n 5

#The number of lines in the Baxter
samtools view ../Downloads/Baxter.bam | wc -l

#Flag stat of the baxter file saved into a file
samtools flagstat ../Downloads/Baxter.bam > flagbax.txt

#View the flagstat file
cat flagbax.txt

#View the header of Chara 
samtools view -H ../Downloads/Chara.bam

#To send the first segment of Chara to a file
samtools view -f 64 ../Downloads/Chara.bam > firstsegment.txt

#To check for secondary alignment
samtools view -f 256 ../Downloads/Chara.bam

#Number of lines in Chara
samtools view ../Downloads/Chara.bam | wc -l

#Send the flagstat of Chara into a file
samtools flagstat ../Downloads/Chara.bam >  statChara.txt

#printing of the file
cat statChara.txt

#Moving the result files to the output directory
mv firstsegment.txt flagbax.txt statChara.txt ../output

#Back to home
cd ../

#Download directory
cd Downloads

#Runsamtools
samtools

#Using samtools to sort the bam files
samtools sort Baxter.bam -o Baxter_sorted.bam

#Using samtools to sort the bam files
samtools sort Chara.bam -o Chara_sorted.bam

#Navi to output
cd ../output

#directory for Baxter
mkdir BaxterQ

#Navigated to fastop dir
cd ../fastop

#Run Qualimap bamqc
qualimap bamqc

#Run qualimap bamqc on the sorted file and save to the output dir
qualimap bamqc -bam ../Downloads/Baxter_sorted.bam --outdir=../output/BaxterQ

#Navigated to the output dir
cd ../output/

#Navigated to BaxterQ
cd BaxterQ

#List the files
ls

#Navi to the raw file
cd raw_data_qualimapReport

#Listing the files
ls

#printing the histogram coverage
cat coverage_histogram.txt

#Back to home
cd ../../../

#Navi to the output dir and created CharaQ dir
cd output && mkdir CharaQ

#Navi to fastop dir
cd ../fastop

#Ran qualimap bamqc on the sorted file and saved it to the CharaQ dir in output dir
qualimap bamqc -bam ../Downloads/Chara_sorted.bam --outdir=../output/CharaQ

#Navi to CharaQ
cd ../output/CharaQ

#Listing the files
ls

#Navi to the Raw report folder
cd raw_data_qualimapReport

#listing the files
ls

#View the genome coverage fraction
cat genome_fraction_coverage.txt

#back to the home dir
cd ../../../
