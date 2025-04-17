ensure_path('TEXINPUTS', 'auxi//', 'bib-commons//');
$bibtex =~ s/bibtex/bibtex -min-crossrefs=9999/;
