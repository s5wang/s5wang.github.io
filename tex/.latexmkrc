ensure_path('TEXINPUTS', 'auxi//', 'bib-commons//');
ensure_path('BSTINPUTS', 'auxi//');
$bibtex =~ s/bibtex/bibtex -min-crossrefs=9999/;
