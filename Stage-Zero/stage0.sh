felixishabiyi@cloudshell:~$ firstname='felix'
felixishabiyi@cloudshell:~$ lastname='ishabiyi'
felixishabiyi@cloudshell:~$ echo $firstname $lastname
felix ishabiyi
felixishabiyi@cloudshell:~$ echo $firstname
felix
felixishabiyi@cloudshell:~$ 
felixishabiyi@cloudshell:~$ mkdir felix
felixishabiyi@cloudshell:~$ mkdir biocomputing && cd biocomputing
felixishabiyi@cloudshell:~/biocomputing$ 
felixishabiyi@cloudshell:~/biocomputing$ wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna 
felixishabiyi@cloudshell:~/biocomputing$ wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
felixishabiyi@cloudshell:~/biocomputing$ wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk 
felixishabiyi@cloudshell:~/biocomputing$ mv wildtype.fna ../felix
felixishabiyi@cloudshell:~/biocomputing$ rm wildtype.gbk.1
felixishabiyi@cloudshell:~/biocomputing$ grep 'tatatata' wildtype.gbk
felixishabiyi@cloudshell:~/biocomputing$ grep 'tatatata' wildtype.gbk > mutant
felixishabiyi@cloudshell:~/biocomputing$ clear && history
felixishabiyi@cloudshell:~/biocomputing$ ls
mutant  wildtype.gbk
felixishabiyi@cloudshell:~/biocomputing$ cd ../felix
felixishabiyi@cloudshell:~/felix$ ls
wildtype.fna
felixishabiyi@cloudshell:~/felix$ cd ../
felixishabiyi@cloudshell:~$ exit
felixishabiyi@cloudshell:~$ sudo apt install figlet toilet
felixishabiyi@cloudshell:~$ figlet -c felix ishabiyi
felixishabiyi@cloudshell:~$ mkdir compare
felixishabiyi@cloudshell:~/compare$ wget https://www.bioinformatics.babraham.ac.uk/training/Introduction%20to%20Unix/unix_intro_data.tar.gz
felixishabiyi@cloudshell:~/compare$ gunzip unix_intro_data.tar.gz
felixishabiyi@cloudshell:~/compare$ tar -xvf unix_intro_data.tar
felixishabiyi@cloudshell:~/compare$ cd seqmonk_genomes/
felixishabiyi@cloudshell:~/compare/seqmonk_genomes$ cd 'Saccharomyces cerevisiae'
felixishabiyi@cloudshell:~/.../seqmonk_genomes/Saccharomyces cerevisiae$ cd EF4/
felixishabiyi@cloudshell:~/.../Saccharomyces cerevisiae/EF4$ grep 'rRNA' Mito.dat
felixishabiyi@cloudshell:~/.../Saccharomyces cerevisiae/EF4$ cp Mito.dat ../../../
felixishabiyi@cloudshell:~/compare$ nano Mito.dat
D   EF4:Mitochondrion   standard; DNA; UNK; 85779 BP.
XX
AC   chromosome:EF4:Mitochondrion:1:85779:1;
felixishabiyi@cloudshell:~/compare$ mv Mito.dat Mitochondrion.txt
felixishabiyi@cloudshell:~/compare/FastQ_Data$ wc -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
15535 lane8_DD_P4_TTAGGC_L008_R1.fastq.gz
felixishabiyi@cloudshell:~/compare/FastQ_Data$ wc  -l lane8_DD_P4_TTAGGC_L008_R1.fastq.gz > length








