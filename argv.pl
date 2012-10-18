#!/usr/bin/perl
use strict;
use warnings;

my $numArgs = $#ARGV + 1;
print "$numArgs arguments\n";
foreach my $argnum (0 .. $#ARGV) {
   print "$ARGV[$argnum]\n";
}
