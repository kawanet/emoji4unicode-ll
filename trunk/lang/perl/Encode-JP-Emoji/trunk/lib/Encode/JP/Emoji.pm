=head1 NAME

Encode::JP::Emoji - Emoji encodings and cross-mapping tables in pure Perl

=head1 SYNOPSIS

    use Encode;
    use Encode::JP::Emoji;

    # DoCoMo Shift_JIS <SJIS+F89F> octets to DoCoMo UTF-8 <U+E63E> octets
    my $sun = "\xF8\x9F";
    Encode::from_to($sun, 'x-sjis-emoji-docomo', 'utf8');

    # KDDI Shift_JIS <SJIS+F7F5> octets to SoftBank Shift_JIS <SJIS+F747> octets
    my $scream = "\xF7\xF5";
    Encode::from_to($scream, 'x-sjis-e4u-kddi', 'x-sjis-e4u-softbank');

    # DoCoMo UTF-8 <U+E6E2> octets to Google UTF-8 <U+FE82E> octets
    my $keycap1 = "\xEE\x9B\xA2";
    Encode::from_to($keycap1, 'x-utf8-e4u-docomo', 'utf8');

    # Google UTF-8 <U+FE001> string to KDDI Shift_JIS <SJIS+F7C5> octets
    my $newmoon = "\x{FE011}";
    my $kddi = Encode::encode('x-sjis-e4u-kddi', $newmoon);

    # SoftBank Shift_JIS <SJIS+F750> octets to SoftBank UTF-8 <U+E110> string
    my $clover = "\xF7\x50";
    my $softbank = Encode::decode('x-sjis-emoji-softbank', $clover);

=head1 DESCRIPTION

This module provides encodings which support emoji picture characters.

The first group of encodings uses carriers' private code points
as Perl's internal string which has UTF-8 flag on.

    Canonical                   Encoding    Octets Emoji    String Emoji
    --------------------------------------------------------------------
    x-sjis-emoji-docomo         Shift_JIS   DoCoMo          DoCoMo
    x-sjis-emoji-kddi           Shift_JIS   KDDI(S)         KDDI(A)
    x-sjis-emoji-kddiweb        Shift_JIS   KDDI(S)         KDDI(B)
    x-sjis-emoji-softbank       Shift_JIS   SoftBank(2G/3G) SoftBank
    x-sjis-emoji-softbank2g     Shift_JIS   SoftBank(2G)    SoftBank
    x-sjis-emoji-softbank3g     Shift_JIS   SoftBank(3G)    SoftBank
    x-utf8-emoji-docomo         UTF-8       DoCoMo          DoCoMo
    x-utf8-emoji-kddi           UTF-8       KDDI(A)         KDDI(A)
    x-utf8-emoji-kddiweb        UTF-8       KDDI(B)         KDDI(B)
    x-utf8-emoji-softbank       UTF-8       SoftBank(2G/3G) SoftBank
    x-utf8-emoji-softbank2g     UTF-8       SoftBank(2G)    SoftBank
    x-utf8-emoji-softbank3g     UTF-8       SoftBank(3G)    SoftBank
    x-utf8-emoji-google         UTF-8       Google          Google
    x-utf8-emoji-unicode        UTF-8       Unicode Std.    Unicode Std.
    --------------------------------------------------------------------

KDDI(A) is documented version which uses their private code points.
KDDI(B), on the other hand, is B<undocumented version> of them.
KDDI(S) is the same Shift_JIS encoding both for KDDI(A) and (B).

SoftBank(2G) uses escape sequence styles of emoji.
SoftBank(3G) uses binary representations.
SoftBank(2G/3G) accepts both for decoding and encodes to 3G binary style.

C<x-utf8-emoji-unicode> encodes the Unicode's standard code points proposed
by emoji4unicode project.

Note that C<x-utf8-emoji-***> encodings, in fact, need to do nothing
when they are decoded and encoded.

The next group uses Googles's private code points internaly.

    Canonical                   Encoding    Octets Emoji    String Emoji
    --------------------------------------------------------------------
    x-sjis-e4u-docomo           Shift_JIS   DoCoMo          Google
    x-sjis-e4u-kddi             Shift_JIS   KDDI(S)         Google
    x-sjis-e4u-kddiweb          Shift_JIS   KDDI(S)         Google
    x-sjis-e4u-softbank         Shift_JIS   SoftBank(2G/3G) Google
    x-sjis-e4u-softbank2g       Shift_JIS   SoftBank(2G)    Google
    x-sjis-e4u-softbank3g       Shift_JIS   SoftBank(3G)    Google
    x-utf8-e4u-docomo           UTF-8       DoCoMo          Google
    x-utf8-e4u-kddi             UTF-8       KDDI(A)         Google
    x-utf8-e4u-kddiweb          UTF-8       KDDI(B)         Google
    x-utf8-e4u-softbank         UTF-8       SoftBank(2G/3G) Google
    x-utf8-e4u-softbank2g       UTF-8       SoftBank(2G)    Google
    x-utf8-e4u-softbank3g       UTF-8       SoftBank(3G)    Google
    x-utf8-e4u-google           UTF-8       Google          Google
    x-utf8-e4u-unicode          UTF-8       Unicode Std.    Google
    --------------------------------------------------------------------

This means Google's encoding could be the interchange encoding for others.
The cross-carriers mapping tables are based on emoji4unicode, 
Emoji for Unicode, project on Google Code.
See more detail on L<http://code.google.com/p/emoji4unicode/> about the project.

Tha last group rejects any emojis.
You would use these encodings with L<Encode::JP::Emoji::Fallback> fallback functions.

    Canonical                   Encoding
    --------------------------------------------------------------------
    x-sjis-emoji-none           Shift_JIS
    x-utf8-emoji-none           UTF-8
    x-sjis-e4u-none             Shift_JIS
    x-utf8-e4u-none             UTF-8
    --------------------------------------------------------------------

=head1 DEPENDENCIES

This module requires Perl version 5.8.1 or later.

L<Unicode::Emoji::E4U> is not required on run time.

=head1 LINKS

=over 4

=item * Subversion Trunk

L<http://emoji4unicode-ll.googlecode.com/svn/trunk/lang/perl/Encode-JP-Emoji/trunk/>

=item * Project Hosting on Google Code

L<http://code.google.com/p/emoji4unicode-ll/>

=item * Google Groups and some Japanese documents

L<http://groups.google.com/group/emoji4unicode-ll>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Encode-JP-Emoji>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Encode-JP-Emoji>

=item * Search CPAN

L<http://search.cpan.org/dist/Encode-JP-Emoji/>

=back

=head1 AUTHOR

Yusuke Kawasaki, L<http://www.kawa.net/>

=head1 SEE ALSO

L<Encode> and L<Unicode::Emoji::E4U>

=head1 COPYRIGHT

Copyright 2009 Yusuke Kawasaki, all rights reserved.

=cut

package Encode::JP::Emoji;
use strict;
use warnings;
use Encode::JP::Emoji::PP;

our $VERSION = '0.03';

1;
