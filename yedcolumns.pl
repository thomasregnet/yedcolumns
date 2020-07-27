#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

use Getopt::Std;

my %opts;
getopts('it', \%opts);


say '<html>';

if ($opts{i}) {
  say format_column('id', 'b', 'u');
}

for my $arg (@ARGV) {
  my ($column, @tags) = split(':', $arg);

  say format_column($column, @tags)
}

if ($opts{t}) {
  say format_column('created_at', 'b');
  say format_column('updated_at', 'b');
}

say '</html>';

sub format_column {
  my ($column, @tags) = @_;

  for my $tag (reverse @tags) { $column = "<$tag>$column</$tag>" }

  return $column . '<br>';
}
