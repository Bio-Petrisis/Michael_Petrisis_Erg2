use strict;
use warnings;

while(<>){
    if(/^[ATCG]+$/i){
        print"valid sequence";
    }else{
        print"Invalid sequence";
    }
}