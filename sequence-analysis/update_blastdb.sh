## Date Created: April 17, 2019
## Updated by: Janani Ravi
## Purpose: To update to BLASTDB v5 (& likely all BLASTDBs)

## This chunk below would work ONLY on MSU's HPC
# Start w/ ssh username@hpcc.msu.edu | for users w/ write access to blastdb or subfolders
cd /mnt/research/common-data/Bio/blastdb
module purge
# Loading Blast+; https://wiki.hpcc.msu.edu/pages/viewpage.action?pageId=11896703
module load icc/2017.4.196-GCC-6.4.0-2.28  impi/2017.3.196 BLAST+/2.8.1-Python-2.7.14

## Checking latest updates for version 5
# https://ftp.ncbi.nlm.nih.gov/blast/db/v5/blastdbv5.pdf
echo "\nHere are the BLASTDB v5 files to be downloaded:\n"
update_blastdb.pl --blastdb_version 5 --showall
## These are the ones available as of April 17, 2019
# nr_v5
# nt_v5
# pdb_v5
# refseq_rna_v5
# swissprot_v5
# taxdb
# Downloading the updates for v5
echo "\nDownloading the BLASTDB v5 databases & decompressing\n"
update_blastdb.pl --blastdb_version 5 nr_v5 --decompress
update_blastdb.pl --blastdb_version 5 nt_v5 --decompress
update_blastdb.pl --blastdb_version 5 pdb_v5 --decompress
update_blastdb.pl --blastdb_version 5 refseq_rna_v5 --decompress
update_blastdb.pl --blastdb_version 5 swissprot_v5 --decompress
update_blastdb.pl --blastdb_version 5 taxdb --decompress

# What are the latest files?
echo "\nHere are ALL the latst BLASTDB files!\nEdit your script to download the necessary ones.\n"
update_blastdb.pl --passive --showall
