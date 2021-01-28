threshold=5
source="./Source/"
archive="./Archive/"
for filename in $(ls $source); do
	size=$(du --apparent-size $source$filename | awk '{ print $1 }')
	#echo $source$filename
	if [ $size -ge $threshold ]
	then
		datetime=$(date +%d%m%Y%H%M%S)
		tar -cf $archive$filename\_$datetime.tgz $source$filename 
		echo "greater, so compressing : " $filename
	else
		echo "smaller, so ignoring : " $filename
	fi
done;	