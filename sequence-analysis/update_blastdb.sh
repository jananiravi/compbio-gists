## Date Created: April 17, 2019
## Updated by: Janani Ravi
## Purpose: To update to BLASTDB v5 (& likely all BLASTDBs)
## The BLASTDB (all, v5) files available as of April 17, 2019: 
## https://github.com/jananiravi/compbio-gists/blob/master/sequence-analysis/blastdb_list.md

## This chunk below would work ONLY on MSU's HPC
# Start w/ ssh username@hpcc.msu.edu | for users w/ write access to blastdb or subfolders
cd /mnt/research/common-data/Bio/blastdb
module purge
# Loading Blast+; https://wiki.hpcc.msu.edu/pages/viewpage.action?pageId=11896703
module load icc/2017.4.196-GCC-6.4.0-2.28 impi/2017.3.196 BLAST+/2.8.1-Python-2.7.14

## Checking latest updates for version 5
# https://ftp.ncbi.nlm.nih.gov/blast/db/v5/blastdbv5.pdf
printf "\nHere are the BLASTDB v5 files to be downloaded:\n"
update_blastdb.pl --blastdb_version 5 --showall
update_blastdb.pl --blastdb_version 5 --showall > blastdb_v5_update_list.txt

# Downloading the updates for v5
printf "\nSTARTING the downloads of BLASTDB v5 databases\n"
while read f; do
printf "\nDownloading $f...\n"
# update_blastdb.pl --blastdb_version 5 $f
update_blastdb.pl --blastdb_version 5 $f --decompress
done <blastdb_v5_update_list.txt

# What are the latest files?
printf "\nHere are ALL the latst BLASTDB files!\n"
update_blastdb.pl --passive --showall
update_blastdb.pl --passive --showall > blastdb_update_list.txt

# Downloading and decompressing all BLASTDB files
printf "\nDownloading ALL the latest BLASTDBs\n"
while read f; do
printf "\nDownloading $f\n"
update_blastdb.pl $f --passive --decompress
done <blastdb_update_list.txt

printf "And we are done! :)"
