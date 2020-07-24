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

for my $column (@ARGV) {
  my @tags = split(':', $column);

  my $column_name = pop @tags;

  say format_column($column_name, @tags)
}

if ($opts{t}) {
  say format_column('created_at', 'b');
  say format_column('updated_at', 'b');
}

say '</html>';

sub format_column {
  my ($column_name, @tags) = @_;

  start_tags(@tags) . $column_name . end_tags(@tags) . '<br>'
}

sub start_tags {
  return tags('<', @_);
}

sub end_tags {
  return tags('</', @_);
}

sub tags {
  my ($prefix, @tags) = @_;

  my $tags = q{};

  for my $tag (@tags) {
    $tags .= $prefix . $tag . '>';
  }

  return $tags;
}
