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
