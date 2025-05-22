#$dna='TGACATAGTCGTATGAGGCGTGATACATAGCAC';

my %gc = (
    'GCA'=>'A','GCC'=>'A','GCG'=>'A','GCT'=>'A',
    'AGA'=>'R','AGG'=>'R','CGA'=>'R','CGC'=>'R','CGG'=>'R','CGT'=>'R',
    'AAC'=>'N','AAT'=>'N','GAC'=>'D','GAT'=>'D',
    'TGC'=>'C','TGT'=>'C','GAA'=>'E','GAG'=>'E',
    'CAA'=>'Q','CAG'=>'Q','GGA'=>'G','GGC'=>'G','GGG'=>'G','GGT'=>'G',
    'CAC'=>'H','CAT'=>'H','ATA'=>'I','ATC'=>'I','ATT'=>'I',
    'TTA'=>'L','TTG'=>'L','CTA'=>'L','CTC'=>'L','CTG'=>'L','CTT'=>'L',
    'AAA'=>'K','AAG'=>'K','ATG'=>'M',
    'TTC'=>'F','TTT'=>'F','CCA'=>'P','CCC'=>'P','CCG'=>'P','CCT'=>'P',
    'AGC'=>'S','AGT'=>'S','TCA'=>'S','TCC'=>'S','TCG'=>'S','TCT'=>'S',
    'ACA'=>'T','ACC'=>'T','ACG'=>'T','ACT'=>'T',
    'TGG'=>'W','TAC'=>'Y','TAT'=>'Y',
    'GTA'=>'V','GTC'=>'V','GTG'=>'V','GTT'=>'V',
    'TAA'=>'-','TAG'=>'-','TGA'=>'-'
);


print("please enter the dna seq:");
$dnaseq = <STDIN>;
$complement = '';

chomp($dnaseq);

foreach(split //, $dnaseq){
    if($_ eq 'A') {$complement .= 'T';}
    elsif($_ eq 'G') {$complement .= 'C';}
    elsif($_ eq 'T') {$complement .= 'A';}
    elsif($_ eq 'C') {$complement .= 'G';}
    else{$complement .= $_ ;}
}


$rev_complement = reverse $complement;
#$m2 = $dnaseq;
#$m2 =~ s/T/U/g;

#$check = () = $dnaseq =~ /ATG/g;

# Step 3: Find the first ATG and translate codons
my $protein = '';
if ($dnaseq =~ /(ATG.*)/) {
    my $coding_region = $1;
    for (my $i = 0; $i < length($coding_region) - 2; $i += 3) {
        my $codon = substr($coding_region, $i, 3);
        last if !exists $gc{$codon} || $gc{$codon} eq '-';  # Stop at invalid or stop codon
        $protein .= $gc{$codon};
    }
} else {
    $protein = "[No ATG (start codon) found]";
}

my $protein2 = '';
if ($rev_complement =~ /(ATG.*)/) {
    my $coding_region2 = $1;
    for (my $i = 0; $i < length($coding_region2) - 2; $i += 3) {
        my $codon = substr($coding_region2, $i, 3);
        last if !exists $gc{$codon} || $gc{$codon} eq '-';  # Stop at invalid or stop codon
        $protein2 .= $gc{$codon};
    }
} else {
    $protein2 = "[No ATG (start codon) found]";
}

print("original:          \t$dnaseq\n");
print("complemented:      \t$complement\n");
print"Translated mrna:  \t$protein\n";
print"Reversed complement:\t$rev_complement\n";
print"Translated mrna:  \t$protein2\n";