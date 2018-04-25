#!/bin/bash

for f in ./*fasta ;
do
name="$(echo '${f}' | cut -d '.' -f 1") ; hold file name without extension 
mkdir SMART"$name" ;
mkdir SMART"$name"_keep ;
perl SMART_batch.pl --inputFile "${f}" --outputDirectory SMART"$name" ; 
find SMART"$name" -name "*.txt" | xargs egrep "SANT" | cut -d ":" -f 1 | xargs -I  '{}' mv {} SMART"$name"_keep ; done
