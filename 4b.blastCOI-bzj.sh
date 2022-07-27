
conda activate enviroDNA

inDir="/share/ScratchGeneral/nenbar/projects/Anthony/scripts/COI"

#amplicons=( "18S" "COI" )
amplicon=( "COI" )
for i in {0..9};do
    annotationDir="/share/ScratchGeneral/nenbar/projects/Anthony/annotation/blast/$amplicon"
    #blastLine="blastn -query $inDir/all.otus_$amplicon$type.fasta -db $annotationDir/"$amplicon"_metazoa -outfmt 6 -out all.otus-"$amplicon$type"_metazoa.tab"
  	blastLine="blastn -word_size 11 -qcov_hsp_perc 50 -query $inDir/OTUsforBlast.1$i.fasta -max_target_seqs 5 -db $annotationDir/"$amplicon"_metazoa_uniq -outfmt \"6 qseqid sseqid pident length mismatch gapopen qcovs evalue bitscore\" -out all.otus-"$amplicon"1"$i"_metazoa.tab"

    qsub -b y -cwd -j y -N blast$i$amplicon -R y -pe smp 5 -V $blastLine
done;
