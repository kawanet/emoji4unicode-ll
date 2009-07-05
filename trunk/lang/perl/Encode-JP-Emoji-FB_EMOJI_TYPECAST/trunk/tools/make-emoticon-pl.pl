#!/usr/bin/perl

use strict;
use warnings;
use Carp ();
use LWP::UserAgent;
use YAML::Syck;
use Data::Dumper;

my $EMOTICON_YAML = 'http://typecastmobile.googlecode.com/svn/trunk/conf/emoticon.yaml';
my $EMOTICON_PL = 'lib/Encode/JP/Emoji/FB_EMOJI_TYPECAST/Emoticon.pl';

if (! scalar @ARGV || $ARGV[0] eq '-h') {
    print STDERR "Usage:\n";
    print STDERR "**** to load local yaml:\n";
    print STDERR "$0 tools/emoticon.yaml > $EMOTICON_PL\n";
    print STDERR "**** to fetch yaml file from google code:\n";
    print STDERR "$0 $EMOTICON_YAML > $EMOTICON_PL\n";
    exit;
}

sub main {
    my $yaml = shift @ARGV || $EMOTICON_YAML;
    print &make_data($yaml);
}

sub make_data {
    my $yaml = shift;

    local $Data::Dumper::Indent = 1; # less indent
    local $Data::Dumper::Terse  = 1; # no $VAR1 =
    local $Data::Dumper::Useqq  = 1; # escape \r\n\t

    my $data;
    if ($yaml =~ m#^https?://#) {
        my $ua   = LWP::UserAgent->new;
        my $res  = $ua->get($yaml);
        my $text = $res->decoded_content;
        $data = YAML::Syck::Load($text);
    } else {
        $data = YAML::Syck::LoadFile($yaml);
    }
    scalar Dumper($data);
}

&main();
