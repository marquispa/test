### Creating QC Tag Directories and Computing ChIP-Seq Quality Metrics

To facilitate the analysis of ChIP-Seq, the [HOMER] software [@homer] transforms the sequence alignment into a platform independent data structure representing the experiment. All relevant information about the experiment is organized into a 'Tag Directory'. During the creation of tag directories, several quality control routines are run to help provide information and feedback about the quality of the experiment. Several important parameters are estimated that are later used for downstream analysis, such as the estimated length of ChIP-Seq fragments.

Four quality metrics are obtained using [HOMER]. Tag count represents the number of reads per unique position. If an experiment is over sequenced, the number of duplicate reads goes up and so does the mean tag count. An average tag count below 1.5 is usually recommended. Tag autocorrelation is the distribution of distance between adjacent reads. Two distributions are shown, one for the same strand and one for the opposite strand. The value at which the opposite strand distribution is maximum usually represents the fragment length. Sequence bias shows the relationship between sequencing reads and the genomic sequence. Small variations at the beginning of the reads can happen; overall the nucleotide ratios should remain constant. GC content bias shows the content of GC for each read. If the GC distribution of the reads is shifted compared to the genome distribution, the reads could be over represented in GC rich or GC poor regions. For additional information, please refer to the [HOMER] website.
