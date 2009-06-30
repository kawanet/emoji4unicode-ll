=head1 NAME

Unicode::Emoji::E4U - Emoji mappings based on emoji4unicode project

=head1 SYNOPSIS

will be described later.

=head1 METHODS

will be described later.

=head1 LINKS

=over 4

=item * Subversion Trunk

L<http://emoji4unicode-ll.googlecode.com/svn/trunk/lang/perl/Unicode-Emoji-E4U/trunk/>

=item * Project Hosting on Google Code

L<http://code.google.com/p/emoji4unicode-ll/>

=item * Google Groups

L<http://groups.google.com/group/emoji4unicode-ll>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Unicode-Emoji-E4U>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Unicode-Emoji-E4U>

=item * Search CPAN

L<http://search.cpan.org/dist/Unicode-Emoji-E4U/>

=back

=head1 AUTHOR

Yusuke Kawasaki, L<http://www.kawa.net/>

=head1 SEE ALSO

L<Encode::JP::Emoji>

=head1 COPYRIGHT

Copyright 2009 Yusuke Kawasaki, all rights reserved.

=cut

package Unicode::Emoji::E4U;
use Unicode::Emoji::Google;
use Unicode::Emoji::DoCoMo;
use Unicode::Emoji::KDDI;
use Unicode::Emoji::SoftBank;
use Any::Moose;
extends 'Unicode::Emoji::Base';
has google      => (is => 'rw', isa => 'Unicode::Emoji::Google',   lazy_build => 1);
has docomo      => (is => 'rw', isa => 'Unicode::Emoji::DoCoMo',   lazy_build => 1);
has kddi        => (is => 'rw', isa => 'Unicode::Emoji::KDDI',     lazy_build => 1);
has softbank    => (is => 'rw', isa => 'Unicode::Emoji::SoftBank', lazy_build => 1);

our $VERSION = '0.01';

sub _build_google {
    my $self = shift;
    Unicode::Emoji::Google->new(%$self);
}

sub _build_docomo {
    my $self = shift;
    Unicode::Emoji::DoCoMo->new(%$self);
}

sub _build_kddi {
    my $self = shift;
    Unicode::Emoji::KDDI->new(%$self);
}

sub _build_softbank {
    my $self = shift;
    Unicode::Emoji::SoftBank->new(%$self);
}

__PACKAGE__->meta->make_immutable;
