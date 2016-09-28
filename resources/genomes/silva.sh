##
ROOT="$MUGQIC_INSTALL_HOME/genomes/silva_db/"; mkdir -p $ROOT ; cd $ROOT


##  version 111 
wget http://www.arb-silva.de/fileadmin/silva_databases/qiime/Silva_111_release.tgz
tar -zxvf Silva_111_release.tgz
mv Silva_111_post 111
rm -f Silva_111_release.tgz

## Rename files for configuration pattern.
cd 111/taxonomy/
mv 90_Silva_111_taxa_map.txt 90_otu_taxonomy.txt
mv 94_Silva_111_taxa_map.txt 94_otu_taxonomy.txt
mv 97_Silva_111_taxa_map.txt 97_otu_taxonomy.txt
mv 99_Silva_111_taxa_map.txt 99_otu_taxonomy.txt

cd $ROOT
cd 111/rep_set/
gunzip 90_Silva_111_rep_set.fasta.gz
mv 90_Silva_111_rep_set.fasta 90_otus.fasta
gunzip 94_Silva_111_rep_set.fasta.gz
mv 94_Silva_111_rep_set.fasta 94_otus.fasta
gunzip 97_Silva_111_rep_set.fasta.gz
mv 97_Silva_111_rep_set.fasta 97_otus.fasta
gunzip 99_Silva_111_rep_set.fasta.gz
mv 99_Silva_111_rep_set.fasta 99_otus.fasta




## The last version is 119
#wget https://www.arb-silva.de/fileadmin/silva_databases/qiime/Silva_119_provisional_release.zip
#unzip Silva_119_provisional_release.zip

#rm -f __MACOX
#mv Silva119_release 119
#rm -f Silva_119_provisional_release.zip

## Rename files for configuration pattern.
#cd 119/taxonomy/
#cp 90/taxonomy_90_all_levels.txt 90_otu_taxonomy.txt
#cp 94/taxonomy_94_all_levels.txt 94_otu_taxonomy.txt
#cp 97/taxonomy_97_all_levels.txt 97_otu_taxonomy.txt
#cp 99/taxonomy_99_all_levels.txt 99_otu_taxonomy.txt

#cd $ROOT
#cd 119/rep_set/
#cp 90/Silva_119_rep_set90.fna 90_otus.fasta
#cp 94/Silva_119_rep_set94.fna 94_otus.fasta
#cp 97/Silva_119_rep_set97.fna 97_otus.fasta
#cp 99/Silva_119_rep_set99.fna 99_otus.fasta


