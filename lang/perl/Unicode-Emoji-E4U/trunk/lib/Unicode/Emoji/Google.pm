=head1 NAME

Unicode::Emoji::Google - Emoji for Google and cross-mapping table

=head1 SYNOPSIS

will be described later.

=head1 METHODS

will be described later.

=head1 DEFINITION

L<http://emoji4unicode.googlecode.com/svn/trunk/data/emoji4unicode.xml>

=head1 AUTHOR

Yusuke Kawasaki, L<http://www.kawa.net/>

=head1 SEE ALSO

L<Unicode::Emoji::E4U>

=head1 COPYRIGHT

Copyright 2009 Yusuke Kawasaki, all rights reserved.

=cut

package Unicode::Emoji::Google;
use Unicode::Emoji::Base;
use Any::Moose;
extends 'Unicode::Emoji::Base::File';
has list => (is => 'ro', isa => 'ArrayRef', lazy_build => 1);

our $VERSION = '0.01';

sub xmlfile { 'emoji4unicode.xml'; }

sub _build_list {
    my $self = shift;
    my $list = [];
    foreach my $category (@{$self->root->category}) {
        foreach my $subcategory (@{$category->subcategory}) {
            push( @$list, @{$subcategory->e} );
        }
    }
    $list;
}

package Unicode::Emoji::Google::XML::emoji4unicode;
use Any::Moose;
has category    => (is => 'ro', isa => 'Unicode::Emoji::Google::XML::category');

package Unicode::Emoji::Google::XML::category;
use Any::Moose;
has subcategory => (is => 'ro', isa => 'Unicode::Emoji::Google::XML::subcategory');

package Unicode::Emoji::Google::XML::subcategory;
use Any::Moose;
has e => (is => 'ro', isa => 'Unicode::Emoji::Google::XML::e');

package Unicode::Emoji::Google::XML::e;
use Any::Moose;
has docomo          => (is => 'ro', isa => 'Str');
has google          => (is => 'ro', isa => 'Str');
has id              => (is => 'ro', isa => 'Str');
has kddi            => (is => 'ro', isa => 'Str');
has name            => (is => 'ro', isa => 'Str');
has softbank        => (is => 'ro', isa => 'Str');
has unicode         => (is => 'ro', isa => 'Str');
has desc            => (is => 'ro', isa => 'Str');
has glyphRefID      => (is => 'ro', isa => 'Str');
has ann             => (is => 'ro', isa => 'Str');
has img_from        => (is => 'ro', isa => 'Str');
has text_fallback   => (is => 'ro', isa => 'Str');
has in_proposal     => (is => 'ro', isa => 'Str');
has text_repr       => (is => 'ro', isa => 'Str');
has prop            => (is => 'ro', isa => 'Str');

has docomo_emoji   => (is => 'ro', isa => 'Unicode::Emoji::Base::Char', lazy_build => 1);
has kddi_emoji     => (is => 'ro', isa => 'Unicode::Emoji::Base::Char', lazy_build => 1);
has softbank_emoji => (is => 'ro', isa => 'Unicode::Emoji::Base::Char', lazy_build => 1);
has google_emoji   => (is => 'ro', isa => 'Unicode::Emoji::Base::Char', lazy_build => 1);
has unicode_emoji  => (is => 'ro', isa => 'Unicode::Emoji::Base::Char', lazy_build => 1);

sub _build_docomo_emoji   { $_[0]->docomo   && Unicode::Emoji::DoCoMo::Emoji->new(unicode_hex => $_[0]->docomo) };
sub _build_kddi_emoji     { $_[0]->kddi     && Unicode::Emoji::KDDI::Emoji->new(unicode_hex => $_[0]->kddi) };
sub _build_softbank_emoji { $_[0]->softbank && Unicode::Emoji::SoftBank::Emoji->new(unicode_hex => $_[0]->softbank) };
sub _build_google_emoji   { $_[0]->google   && Unicode::Emoji::Google::Emoji->new(unicode_hex => $_[0]->google) };
sub _build_unicode_emoji  { $_[0]->unicode  && Unicode::Emoji::Unicode::Emoji->new(unicode_hex => $_[0]->unicode) };

package Unicode::Emoji::Google::Emoji;
use Any::Moose;
extends 'Unicode::Emoji::Base::Char';

package Unicode::Emoji::Unicode::Emoji;
use Any::Moose;
extends 'Unicode::Emoji::Base::Char';

__PACKAGE__->meta->make_immutable;
