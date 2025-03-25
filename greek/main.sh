#!/usr/bin/env bash
for book in $(gospels)
do
	for chap in $(chaps $book)
	do
		chapter=$(printf "%02d" $chap)
		filename="$book-$chapter.txt"
		chap $chap $book > $filename
		echo $filename
	done
done
