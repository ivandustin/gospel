#!/usr/bin/env bash
set -euvxo pipefail
rm -f */*.md
for dir in $(find * -type d)
do
	pushd $dir
	for file in *.txt
	do
		stem=${file%.*}
		parts=(${stem//-/ })
		book=${parts[0]}
		chap=${parts[1]}
		chap=$((10#$chap))
		out="$book.md"
		if [ ! -f $out ]
		then
			(
				echo "# ${book^}"
				echo
			) > $out
		fi
		(
			echo "## Chapter $chap"
			echo
			addnl < $file
		) >> $out
	done
	popd
done
stripi */*.md
doctoc --title "Table of Contents" */*.md
