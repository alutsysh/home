#!perl

use strict;
use Data::Dumper;


my $f_name='../Unihan_NumericValues.txt';
my %count;

open(FIN, '<', $f_name) or die $!;
while(<FIN>){
    my $line = $_;
    my @set = split(//,$line);
    $count{$_}++ for @set;
}
close(FIN);

foreach my $i (sort {$a cmp $b} keys %count){
    printf("File char: <%s>\tChar code: %d\tCount:%d\n", $i, ord($i), $count{$i});
}
exit(0)