#!/bin/bash

# input "salmonella_typhimurium_lt2" here
REF=$1

# input "SRR10561173"
SRR=$2


echo -e "###\nThe reference is $REF\n\n"
echo -e  "###\nWe are now dealing with $SRR\n\n"


source activate bioinfo

mkdir ~/call_snp

bwa index ~/seq/${REF}.fasta

bwa mem -t 4 -R '@RG\tID:foo\tPL:illumina\tSM:${SRR}' ~/seq/${REF}.fasta  ~/seqtk/${SRR}_1P_seqtk.fastq ~/seqtk/${SRR}_2P_seqtk.fastq | samtools view -Sb - > ~/call_snp/${SRR}.bam

samtools sort -@ 4 -m 4G -O bam -o ~/call_snp/${SRR}.sorted.bam ~/call_snp/${SRR}.bam

gatk MarkDuplicates -I ~/call_snp/${SRR}.sorted.bam -O ~/call_snp/${SRR}.sorted.markdup.bam -M ~/call_snp/${SRR}.sorted.markdup_metrics.txt

samtools index ~/call_snp/${SRR}.sorted.markdup.bam
