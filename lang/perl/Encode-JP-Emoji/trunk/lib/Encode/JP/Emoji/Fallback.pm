package Encode::JP::Emoji::Fallback;
use strict;
use warnings;
use base 'Exporter';

our @EXPORT = qw(
    FB_DOCOMO_TEXT FB_KDDI_TEXT FB_SOFTBANK_TEXT FB_GOOGLE_TEXT FB_UNICODE_TEXT
    FB_DOCOMO_HTML FB_KDDI_HTML FB_SOFTBANK_HTML FB_GOOGLE_HTML FB_UNICODE_HTML
);

our $HEX_FORMAT      = '%04X';
our $XMLCREF_FORMAT  = '&#x%04X;';
our $DOCOMO_FORMAT   = '<img src="http://mail.google.com/mail/e/docomo_ne_jp/%03X" class="e" />';
our $KDDI_FORMAT     = '<img src="http://mail.google.com/mail/e/ezweb_ne_jp/%03X" class="e" />';
our $SOFTBANK_FORMAT = '<img src="http://mail.google.com/mail/e/softbank_ne_jp/%03X" class="e" />';
our $GOOGLE_FORMAT   = '<img src="http://mail.google.com/mail/e/google_com/%03X" class="e" />';
our $UNICODE_FORMAT  = '<img src="http://mail.google.com/mail/e/google_com/%03X" class="e" />';

sub FB_DOCOMO_TEXT {
    sub {
        my $code = shift;
        my $hex  = sprintf $HEX_FORMAT => $code;
        return sprintf $XMLCREF_FORMAT => $code unless exists $Encode::JP::Emoji::Mapping::CharnamesEmojiDocomo{$hex};
        $Encode::JP::Emoji::Mapping::CharnamesEmojiDocomo{$hex};
    }
}

sub FB_KDDI_TEXT {
    sub {
        my $code = shift;
        my $hex  = sprintf $HEX_FORMAT => $code;
        return sprintf $XMLCREF_FORMAT => $code unless exists $Encode::JP::Emoji::Mapping::CharnamesEmojiKddi{$hex};
        $Encode::JP::Emoji::Mapping::CharnamesEmojiKddi{$hex};
    };
}

sub FB_SOFTBANK_TEXT {
    sub {
        my $code = shift;
        my $hex  = sprintf $HEX_FORMAT => $code;
        return sprintf $XMLCREF_FORMAT => $code unless exists $Encode::JP::Emoji::Mapping::CharnamesEmojiSoftbank{$hex};
        $Encode::JP::Emoji::Mapping::CharnamesEmojiSoftbank{$hex};
    };
}

sub FB_GOOGLE_TEXT {
    sub {
        my $code = shift;
        my $hex  = sprintf $HEX_FORMAT => $code;
        return sprintf $XMLCREF_FORMAT => $code unless exists $Encode::JP::Emoji::Mapping::CharnamesEmojiGoogle{$hex};
        $Encode::JP::Emoji::Mapping::CharnamesEmojiGoogle{$hex};
    };
}

sub FB_UNICODE_TEXT {
    sub {
        my $code = shift;
        my $hex  = sprintf $HEX_FORMAT => $code;
        return sprintf $XMLCREF_FORMAT => $code unless exists $Encode::JP::Emoji::Mapping::CharnamesEmojiUnicode{$hex};
        $Encode::JP::Emoji::Mapping::CharnamesEmojiUnicode{$hex};
    };
}

my $utf8     = Encode::find_encoding('utf8');
my $docomo   = Encode::find_encoding('x-utf8-e4u-docomo-pp');
my $kddi     = Encode::find_encoding('x-utf8-e4u-kddi-pp');
my $softbank = Encode::find_encoding('x-utf8-e4u-softbank-pp');
my $unicode  = Encode::find_encoding('x-utf8-e4u-unicode-pp');

sub FB_DOCOMO_HTML {
    my $format = shift || $DOCOMO_FORMAT;
    sub {
        my $code = shift;
        my $google = ord $docomo->decode($utf8->encode(chr $code));
        return sprintf $XMLCREF_FORMAT => $code if ($google < 0xFE000);
        sprintf $format => ($google & 0x07FF);
    }
}

sub FB_KDDI_HTML {
    my $format = shift || $KDDI_FORMAT;
    sub {
        my $code = shift;
        my $google = ord $kddi->decode($utf8->encode(chr $code));
        return sprintf $XMLCREF_FORMAT => $code if ($google < 0xFE000);
        sprintf $format => ($google & 0x07FF);
    }
}

sub FB_SOFTBANK_HTML {
    my $format = shift || $SOFTBANK_FORMAT;
    sub {
        my $code = shift;
        my $google = ord $softbank->decode($utf8->encode(chr $code));
        return sprintf $XMLCREF_FORMAT => $code if ($google < 0xFE000);
        sprintf $format => ($google & 0x07FF);
    }
}

sub FB_GOOGLE_HTML {
    my $format = shift || $GOOGLE_FORMAT;
    sub {
        my $code = shift;
        return sprintf $XMLCREF_FORMAT => $code if ($code < 0xFE000);
        sprintf $format => ($code & 0x07FF);
    };
}

sub FB_UNICODE_HTML {
    my $format = shift || $UNICODE_FORMAT;
    sub {
        my $code = shift;
        my $google = ord $unicode->decode($utf8->encode(chr $code));
        return sprintf $XMLCREF_FORMAT => $code if ($google < 0xFE000);
        sprintf $format => ($google & 0x07FF);
    };
}

1;
