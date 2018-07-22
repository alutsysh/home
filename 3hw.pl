#!perl

use strict;

my $conf_file=q[../conf];
my %conf;
my @section;
my @vals;
my %val;

open (CONF,'<', $conf_file) or die $!;
while (<CONF>){
    my $li=$_; chomp($li);
    $li =~ s/^#/{@section = split(m#\s#, $li); }/e;
    $li =~ s/=/{@vals = split(m#=#, $li); $conf{ $section[1] }{ $vals[0] } = $vals[1]+0.3; }/e;
}
close(CONF);

open(FOUT, '>', $conf_file) or die $!;
foreach my $k (sort {$a cmp $b} keys %conf){
	print FOUT "# $k\n";
	print FOUT "$_=$conf{$k}{$_}\n" foreach (keys %{$conf{$k}});
	print FOUT "\n";
}
close(FOUT);
exit(0)