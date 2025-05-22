while(<>){
    if(/^>\s+\|(\w+)\|/){
        print"Found accession : $1\n";
    }
}