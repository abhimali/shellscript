threshold=5
source="./Source/"
archive="./Archive/"
name="compressed.tgz"
# var=$(cat config.csv | awk -F '=' '{print $2}')

for filename in $(ls $source); do
	size=$(du --apparent-size $source$filename | awk '{ print $1 }')
	#echo $source$filename
	if [ $size -ge $threshold ]
	then
		datetime=$(date +%d%m%Y%H%M%S)
		mv $source$filename $archive$filename\_$datetime
		echo "greater, so compressing : " $filename
	else
		echo "smaller, so ignoring : " $filename
	fi
done;

tar -zcf $archive$name $archive
rm $archive/file*
# rm $archive/*.txt