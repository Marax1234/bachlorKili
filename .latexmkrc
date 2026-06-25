# Project-level latexmkrc for Bachelorarbeit
# Overrides /etc/LatexMk for this project

# Use lualatex
$pdf_mode = 4;
$postscript_mode = 0;
$dvi_mode = 0;

# Main file
@default_files = ('main.tex');

# Use biber instead of bibtex (required for biblatex)
$biber = 'biber %O %S';
$bibtex_use = 2;  # use biber

# Run makeglossaries after each latex run if .acn file changed
add_cus_dep('acn', 'acr', 0, 'makeglossaries');
sub makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    pushd $path;
    my $return = system "makeglossaries '$base_name'";
    popd;
    return $return;
}

# Also handle .glo -> .gls
add_cus_dep('glo', 'gls', 0, 'makeglossaries_glo');
sub makeglossaries_glo {
    my ($base_name, $path) = fileparse($_[0]);
    pushd $path;
    my $return = system "makeglossaries '$base_name'";
    popd;
    return $return;
}

# Force continuation despite undefined references (they resolve in later passes)
$force_mode = 1;

# Maximum number of runs to resolve cross-references
$max_repeat = 5;
