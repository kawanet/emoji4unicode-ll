=head1 NAME

Unicode::Emoji::DoCoMo - Emoji for NTT DoCoMo

=head1 SYNOPSIS

will be described later.

=head1 METHODS

will be described later.

=head1 DEFINITION

L<http://emoji4unicode.googlecode.com/svn/trunk/data/docomo/carrier_data.xml>

=head1 AUTHOR

Yusuke Kawasaki, L<http://www.kawa.net/>

=head1 SEE ALSO

L<Unicode::Emoji::E4U>

=head1 COPYRIGHT

Copyright 2009 Yusuke Kawasaki, all rights reserved.

=cut

package Unicode::Emoji::DoCoMo;
use Unicode::Emoji::Base;
use Any::Moose;
extends 'Unicode::Emoji::Base::Carrier';

our $VERSION = '0.01';

sub xmlfile { 'docomo/carrier_data.xml'; }

package Unicode::Emoji::DoCoMo::XML::carrier_data;
use Any::Moose;
has e => (is => 'ro', isa => 'Unicode::Emoji::DoCoMo::XML::e');

package Unicode::Emoji::DoCoMo::XML::e;
use Any::Moose;
has jis     => (is => 'ro', isa => 'Str');
has name_en => (is => 'ro', isa => 'Str');
has name_ja => (is => 'ro', isa => 'Str');
has unicode => (is => 'ro', isa => 'Str');
has docomo_emoji  => (is => 'ro', isa => 'Unicode::Emoji::Base::Char', lazy_build => 1);

sub _build_docomo_emoji { Unicode::Emoji::DoCoMo::Emoji->new(unicode_hex => $_[0]->unicode) };

package Unicode::Emoji::DoCoMo::Emoji;
use Any::Moose;
extends 'Unicode::Emoji::Base::Char::CP932';

sub _unicode_to_cp932 {
    my $self = shift;
    my $code = shift;
    my $sjis;
    return if ($code < 0xE63E);
    return if ($code > 0xE757);
    if ( $code <= 0xE69B ) {
        $sjis = $code+4705;
    } elsif ( $code <= 0xE6DA ) {
        $sjis = $code+4772;
    } else {
        $sjis = $code+4773;
    }
    $sjis;
}

__PACKAGE__->meta->make_immutable;
