
#!/bin/sh

######*********TEAM MEMBERS: Mouli, Roufa,Purnasai, Venkat , Navya, Mounika***************#######

cd 

cd Desktop/project/

####========sed property to add the data horizontally ====================####
sed 's/ /+/g' data | bc > data_total && head -1 data | sed 's/[^ ]//g' | wc -c > data_avg


####=========reads data_total file ========================================####
n=$( cat data_total )

####=========reads data_avg file data=======================================####
q=$( cat data_avg )



####==========for loop to read every line in data_total file and sends to data_percentage file======####
for i in `cat data_total`
do
echo "`expr $i / $q`%" 
done > data_percentage


####==========to allocate grades to file called data_percentage and strore it in output===================####
awk '{if($1 >= 90)print $0",  A Grade"; else if($1 >= 70)print $0",  B Grade"; else if($1 <= 69)print $0",  C Grade"; else print$0",  D Grade" }' data_percentage > output


####============to print the output===================================##### 
paste -d '-' data output
