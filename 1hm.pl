#!perl

use strict;
use Data::Dumper;

my @arr = (1..100);
my %prime = (2=>undef);
my $flag = 1;


for my $i (@arr){
    $flag=1;
    foreach my $j (2..$i/2){
        if ($i % $j==0){$flag=0;}
    }
    if ($flag){
        $prime{$i}=undef;
    }
}

print "Primes: ";
foreach my $i (sort {$a<=>$b} (keys (%prime))){
    print $i, " ";
}

print "\n\n";


my %data = ('even'=>[], 'odd'=>[]);
my $key;

foreach my $i (@arr){
    if ($i % 2 == 0){
        $key = 'even';
    } else {
        $key = 'odd';
    }
    push (@{$data{$key}}, $i);
}

foreach my $k (keys %data){
    print $k, ": ";
    foreach my $i (@{$data{$k}}){
        print $i, " ";
    }
    print "\n";
}

exit(0)