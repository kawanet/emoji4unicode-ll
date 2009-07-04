=encoding utf-8

=head1 NAME

Encode::JP::Emoji::FB_EMOJI_GMAIL - Emoji fallback functions with Gmail

=head1 SYNOPSIS

    use Encode;
    use Encode::JP::Emoji;
    use Encode::JP::Emoji::FB_EMOJI_GMAIL;

    # DoCoMo Shift_JIS <SJIS+F89F> octets
    my $sun = "\xF8\x9F";
    Encode::from_to($sun, 'x-sjis-emoji-docomo', 'x-sjis-emoji-none', FB_DOCOMO_GMAIL());

    # KDDI(app) UTF-8 <U+E598> octets
    my $fog = "\xEE\x96\x98";
    Encode::from_to($fog, 'x-utf8-emoji-kddiapp', 'x-utf8-emoji-none', FB_KDDIAPP_GMAIL());

    # KDDI(web) Shift_JIS <SJIS+F665> octets
    my $cloud = "\xF6\x65";
    Encode::from_to($cloud, 'x-sjis-emoji-kddiweb', 'x-sjis-emoji-none', FB_KDDIWEB_GMAIL());

    # SoftBank UTF-8 <U+E524> string
    my $hamster = "\x{E524}";
    my $softbank = Encode::encode('x-sjis-e4u-none', $hamster, FB_SOFTBANK_GMAIL());

    # Google UTF-8 <U+FE1C1> octets
    my $bear = "\xF3\xBE\x87\x81";
    my $google = Encode::decode('x-utf8-e4u-none', $bear, FB_EMOJI_GMAIL());

=head1 DESCRIPTION

This module exports the following fallback functions which would be used with
C<x-sjis-e4u-none> and C<x-utf8-e4u-none> encodings which rejects any emojis.
Note that this is B<NOT> an official service powered by Gmail.

=head2 FB_DOCOMO_GMAIL()

This returns C<img> element for PC to display DoCoMo's emoji images.
Note that this works only for DoCoMo's private emoji code points.

=head2 FB_KDDIAPP_GMAIL()

This returns C<img> element for PC to display KDDI's emoji images.
Note that this works only for KDDI's private emoji code points.

=head2 FB_KDDIWEB_GMAIL()

This returns C<img> element for PC to display KDDI's emoji images.
Note that this works only for B<undocumented version> of KDDI's private emoji code points.

=head2 FB_SOFTBANK_GMAIL()

This returns C<img> element for PC to display SoftBank's emoji images.
Note that this works only for SoftBank's private emoji code points.

=head2 FB_GOOGLE_GMAIL()

This returns C<img> element for PC to display Google's emoji images.
Note that this works only for Google's private emoji code points.

=head2 FB_UNICODE_GMAIL()

This returns C<img> element for PC to display emoji images.
Note that this works only for emojis of standard code points.

=head2 FB_EMOJI_GMAIL()

This accepts all emoji code points above for ease of use.
Note that SoftBank is prior to KDDIapp in their conflicts code points.

=head1 LINKS

=over 4

=item * Subversion Trunk

L<http://emoji4unicode-ll.googlecode.com/svn/trunk/lang/perl/Encode-JP-Emoji-FB_EMOJI_GMAIL/trunk/>

=item * Project Hosting on Google Code

L<http://code.google.com/p/emoji4unicode-ll/>

=item * Google Groups and some Japanese documents

L<http://groups.google.com/group/emoji4unicode-ll>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Encode-JP-Emoji-FB_EMOJI_GMAIL>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Encode-JP-Emoji-FB_EMOJI_GMAIL>

=item * Search CPAN

L<http://search.cpan.org/dist/Encode-JP-Emoji-FB_EMOJI_GMAIL/>

=back

=head1 AUTHOR

Yusuke Kawasaki, L<http://www.kawa.net/>

=head1 SEE ALSO

L<Encode::JP::Emoji>

=head1 COPYRIGHT

Copyright 2009 Yusuke Kawasaki, all rights reserved.

=cut

package Encode::JP::Emoji::FB_EMOJI_GMAIL;
use strict;
use warnings;
use base 'Exporter';
use Encode ();
use Encode::JP::Emoji;
use Encode::JP::Emoji::Property;

our $VERSION = '0.03';

our @EXPORT = qw(
    FB_EMOJI_GMAIL FB_DOCOMO_GMAIL FB_KDDIAPP_GMAIL FB_KDDIWEB_GMAIL FB_SOFTBANK_GMAIL FB_GOOGLE_GMAIL FB_UNICODE_GMAIL
);

our $FB_DOCOMO_GMAIL   = '<img src="http://mail.google.com/mail/e/docomo_ne_jp/%03X" class="e" />';
our $FB_KDDIAPP_GMAIL     = '<img src="http://mail.google.com/mail/e/ezweb_ne_jp/%03X" class="e" />';
our $FB_KDDIWEB_GMAIL  = '<img src="http://mail.google.com/mail/e/ezweb_ne_jp/%03X" class="e" />';
our $FB_SOFTBANK_GMAIL = '<img src="http://mail.google.com/mail/e/softbank_ne_jp/%03X" class="e" />';
our $FB_GOOGLE_GMAIL   = '<img src="http://mail.google.com/mail/e/%03X" class="e" />';
our $FB_UNICODE_GMAIL  = '<img src="http://mail.google.com/mail/e/%03X" class="e" />';

my $latin1   = Encode::find_encoding('latin1');
my $utf8     = Encode::find_encoding('utf8');
my $docomo   = Encode::find_encoding('x-utf8-e4u-docomo');
my $kddiapp  = Encode::find_encoding('x-utf8-e4u-kddiapp');
my $kddiweb  = Encode::find_encoding('x-utf8-e4u-kddiweb');
my $softbank = Encode::find_encoding('x-utf8-e4u-softbank3g');
my $unicode  = Encode::find_encoding('x-utf8-e4u-unicode');

sub FB_DOCOMO_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        my $google = ord $docomo->decode($utf8->encode($chr));
        return $latin1->encode($chr, $fb) if ($google < 0xFE000);
        sprintf $FB_DOCOMO_GMAIL => ($google & 0x0FFF);
    }
}

sub FB_KDDIAPP_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        my $google = ord $kddiapp->decode($utf8->encode($chr));
        return $latin1->encode($chr, $fb) if ($google < 0xFE000);
        sprintf $FB_KDDIAPP_GMAIL => ($google & 0x0FFF);
    }
}

sub FB_KDDIWEB_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        my $google = ord $kddiweb->decode($utf8->encode($chr));
        return $latin1->encode($chr, $fb) if ($google < 0xFE000);
        sprintf $FB_KDDIWEB_GMAIL => ($google & 0x0FFF);
    }
}

sub FB_SOFTBANK_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        my $google = ord $softbank->decode($utf8->encode($chr));
        return $latin1->encode($chr, $fb) if ($google < 0xFE000);
        sprintf $FB_SOFTBANK_GMAIL => ($google & 0x0FFF);
    }
}

sub FB_GOOGLE_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        return $latin1->encode($chr, $fb) if ($code < 0xFE000);
        sprintf $FB_GOOGLE_GMAIL => ($code & 0x0FFF);
    };
}

sub FB_UNICODE_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        my $google = ord $unicode->decode($utf8->encode($chr));
        return $latin1->encode($chr, $fb) if ($google < 0xFE000);
        sprintf $FB_UNICODE_GMAIL => ($google & 0x0FFF);
    };
}

sub FB_EMOJI_GMAIL {
    my $fb = shift || Encode::FB_XMLCREF();
    sub {
        my $code = shift;
        my $chr  = chr $code;
        my $google;
        my $format;
        if ($chr =~ /\p{InEmojiGoogle}/) {
            $google = $code;
            $format = $FB_GOOGLE_GMAIL;
        } elsif ($chr =~ /\p{InEmojiDoCoMo}/) {
            $google = ord $docomo->decode($utf8->encode($chr));
            $format = $FB_DOCOMO_GMAIL;
        } elsif ($chr =~ /\p{InEmojiKDDIweb}/) {
            $google = ord $kddiweb->decode($utf8->encode($chr));
            $format = $FB_KDDIWEB_GMAIL;
        } elsif ($chr =~ /\p{InEmojiSoftBank}/) {
            $google = ord $softbank->decode($utf8->encode($chr));
            $format = $FB_SOFTBANK_GMAIL;
        } elsif ($chr =~ /\p{InEmojiKDDIapp}/) {
            $google = ord $kddiapp->decode($utf8->encode($chr));
            $format = $FB_KDDIAPP_GMAIL;
        } elsif ($chr =~ /\p{InEmojiUnicode}/) {
            $google = ord $unicode->decode($utf8->encode($chr));
            $format = $FB_UNICODE_GMAIL;
        } else {
            return $latin1->encode($chr, $fb);
        }
        sprintf $format => ($google & 0x0FFF);
    };
}

1;
