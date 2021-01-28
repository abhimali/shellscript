threshold=5
for filename in ./Source/*.txt; do
	size=$(du --apparent-size $filename | awk '{ print $1 }')
	if [ $size -ge $threshold ]
	then
		tar cfz ./Archive/$filename.tgz $filename 
	else
		echo "smaller" $filename
	fi
done;