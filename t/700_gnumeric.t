#!/usr/bin/perl

use strict;
use warnings;

use     Test::More;
require Test::NoWarnings;

use     Spreadsheet::Read;
my $parser = Spreadsheet::Read::parses ("gnumeric") or
    plan skip_all => "No Gnumeric parser found";

print STDERR "# Parser: $parser-", $parser->VERSION, "\n";

for my $file (qw(files/gnumeric.xml files/gnumeric.xml)) {
    # 6 tests per file version.
    ok(Spreadsheet::Read::_txt_is_xml ($file, 'http://www.gnumeric.org/v10.dtd'),
       "$file is Gnumeric XML");
    my $book = ReadData($file);
    ok($book, "have gnumeric book");
    ok(@$book == 4, "it has length 4");
    ok($book->[0]{sheets} == 3, "it has 3 sheets");
    ok($book->[1]{C30} eq 'monthly maintenance fee',
       'cell C30 matches via col/row name');
    ok($book->[1]{cell}[3][30] eq 'monthly maintenance fee',
       'cell C30 matches via array indices');
}

done_testing(2 * 6);
