#!/usr/bin/env perl

use strict;
use warnings;

use feature 'say';

say '<html>';

for my $column (@ARGV) {
    my @tags = split(':', $column);

    my $column_name = pop @tags;

    print start_tags(@tags), $column_name, end_tags(@tags), "<br>\n";
}

say '</html>';

sub start_tags {
    return tags('<', @_);
}

sub end_tags {
    return tags('</', @_);
}

sub tags {
    my ($prefix, @tags) = @_;

    my $tags = q{};

    for my $tag (@tags) { $tags .= $prefix . $tag . '>' }

    return $tags;
}
