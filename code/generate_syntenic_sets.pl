#!/usr/bin/perl -w

use strict;
use Data::Dumper;

my %data;

while (<>) {
	chomp;
 next if /^#/;
	my @line = split /\t/;
  my @item1 = split /\|\|/, $line[1];
  my @item2 = split /\|\|/, $line[5];
  my $at = $item1[3];
	$at =~ s/\.\d$//;
  my $br = $item2[3];
#  print $at,"\t", $br,"\n";
  $data{$at}{$br}=1;	
}

#print Dumper \%data;

foreach my $at (sort keys %data) {
  print $at;
  foreach my $br (sort keys %{$data{$at}}) {
    print "\t", $br;
  }
  print "\n";
}
