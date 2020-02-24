#!/usr/bin/sh
#Script developed by Ram Sai Nanduri
#usage: sh reverse_compliment.sh input.txt


input_seq=$1 #input text file containing each sequences on a new line
wd=$(pwd)
seq=$(cat $wd/$input_seq | sed 's/\n\r/\s/g' )

#echo $seq

for i in $seq
do
	echo $i | tr ACGTacgt TGCAtgca | rev >> $wd/output.txt

done

if [ -f $wd/reverse_compliment_output.txt ]
then
	rm $wd/reverse_compliment_output.txt
fi


echo -e "Raw_Seq\tReverse Complimented Seq" > $wd/reverse_compliment_output.txt
paste $wd/$input_seq $wd/output.txt >> $wd/reverse_compliment_output.txt
rm $wd/output.txt
