#Printing of Firstname and Lastname
firstname='felix'
lastname='ishabiyi'
echo $firstname $lastname
felix ishabiyi
echo $firstname
felix
mkdir felix

#Bash Story One
mkdir biocomputing && cd biocomputing
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna 
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk 
mv wildtype.fna ../felix
rm wildtype.gbk.1
grep 'tatatata' wildtype.gbk
grep 'tatatata' wildtype.gbk > mutant
clear && history
ls
mutant  wildtype.gbk
../felix
ls
wildtype.fna
cd ../
exit

#Bash Story Two
sudo apt install figlet toilet
figlet -c felix ishabiyi
mkdir compare
wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz
gunzip unix_intro_data.tar.gz
tar -xvf unix_intro_data.tar
cd seqmonk_genomes/
cd 'Saccharomyces cerevisiae'
cd EF4/
grep 'rRNA' Mito.dat
cp Mito.dat ../../../
nano Mito.dat
D   EF4:Mitochondrion   standard; DNA; UNK; 85779 BP.
XX
AC   chromosome:EF4:Mitochondrion:1:85779:1;
mv Mito.dat Mitochondrion.txt
wc -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
15535 lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
#length of files in lane8_DD_P4_TTAGGC_L008_R1.fastq.gz saved in the length file
wc  -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz > length
#Total length of all files saved in the totallength file
wc  -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz  lane8_DD_P9_TGACCA_L008_R1.fastq.gz  lane8_FF_P4_ATCACG_L008_R1.fastq.gz  lane8_FF_P9_CGATGT_L008_R1.fastq.gz lane8_DD_P4_TTAGGC_L008_R2.fastq.gz  lane8_DD_P9_TGACCA_L008_R2.fastq.gz  lane8_FF_P4_ATCACG_L008_R2.fastq.gz  lane8_FF_P9_CGATGT_L008_R2.fastq.gz > totallength

echo 'https://github.com/Felixishabiyi/HackBio'






