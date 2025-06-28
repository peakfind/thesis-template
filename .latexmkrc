@default_files = ('main.tex');
$pdf_mode = 1;
$pdflatex = 'xelatex --shell-escape %O %S';
$clean_ext = 'acn acr alg glg glo gls ist hd nav snm out bbl';

# Enable glossaries
add_cus_dep('glo', 'gls', 0, 'makeglossaries');
sub makeglossaries {
    my ($base_name, $path) = fileparse(shift);
    pushd $path;
    system("makeglossaries", $base_name);
    popd;
}