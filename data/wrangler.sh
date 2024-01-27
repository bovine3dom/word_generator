#/bin/bash

#rg "RP.*IPA.*\..*}\$" enwiktionary-20240120-pages-articles\(1\).xml > wrangled.txt

rg -o "\{IPA\|en\|.*?\}" enwiktionary-20240120-pages-articles\(1\).xml > wrangled_trimmed.txt # or |fr| etc
rg -o "/.*?/" wrangled_trimmed.txt > wrangled_one_pron_per_line.txt
rg -o "[ˌ.ˈ/].*?[ˌ.ˈ/]" wrangled_one_pron_per_line.txt| sed 's|[ˌ.ˈ/]||g' | sort | uniq -c | sort --numeric-sort --reverse > syllables.txt 
rm wrangled*

# there aren't enough of them
