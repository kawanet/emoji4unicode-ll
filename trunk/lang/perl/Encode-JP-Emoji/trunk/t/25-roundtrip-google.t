use strict;
use warnings;
use lib 't';
require 'test-util.pl';
use Test::More;
use Encode;
use Encode::JP::Emoji;

my $encoding = 'x-utf8-e4u-google-pp';
my $list = google_list();

plan tests => scalar @$list;

foreach my $strS (@$list) {
	my $hex  = sprintf '%04X' => ord $strS;
	my $octA = encode($encoding, $strS);
	my $strB = decode($encoding, $octA);
    is(shex($strB), shex($strS), "round-trip $hex");
}
