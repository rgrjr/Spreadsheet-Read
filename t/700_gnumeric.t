#!/usr/bin/perl

use strict;
use warnings;

use     Test::More;
require Test::NoWarnings;

use     Spreadsheet::Read;
my $parser = Spreadsheet::Read::parses ("gnumeric") or
    plan skip_all => "No Gnumeric parser found";

ok($parser, 'have a test');

print STDERR "# Parser: $parser-", $parser->VERSION, "\n";

done_testing(1);
