#Activate conda environment
conda activate

#Install fastqc
conda install -c bioconda fastqc

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