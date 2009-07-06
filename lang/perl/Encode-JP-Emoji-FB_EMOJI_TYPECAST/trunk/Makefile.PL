use strict;
require 5.008001;
use ExtUtils::MakeMaker;

my $opt = {
    NAME                =>  'Encode::JP::Emoji::FB_EMOJI_TYPECAST',
    VERSION_FROM        =>  'lib/Encode/JP/Emoji/FB_EMOJI_TYPECAST.pm',
    LICENSE             =>  'gpl',
    PREREQ_PM           =>  {
        'Test::More'        =>  '0',
        'Test::Harness'     =>  '3.04',
        'Encode::JP::Emoji' =>  '0.05',
    },
};

WriteMakefile( %$opt );
