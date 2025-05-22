$protein_line = "MNVEHE _123! LLVE";
$protein_line =~ s/[^A-Z] //g;
print "Cleaned sequence: $protein_line\n";