#!/usr/bin/env bash
set -euo pipefail
out=README.md
for dir in $(find * -type d)
do
	pushd $dir
	rm -f $out
	for file in *.txt
	do
		stem=${file%.*}
		parts=(${stem//-/ })
		book=${parts[0]^}
		chap=${parts[1]}
		chap=$((10#$chap))
		echo "## $book $chap" >> $out
		echo >> $out
		addnl < $file >> $out
	done
	stripi $out
	popd
done
