use strict;
use warnings;
use Test::More;

plan tests => 5;

# ------------------------------------------------------------------------
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
# ------------------------------------------------------------------------

like $sun,      qr[/mail/e/docomo_ne_jp/000],   'SUN FB_DOCOMO_GMAIL';
like $fog,      qr[/mail/e/ezweb_ne_jp/006],    'FOG FB_KDDIAPP_GMAIL';
like $cloud,    qr[/mail/e/ezweb_ne_jp/001],    'CLOUD FB_KDDIWEB_GMAIL';
like $softbank, qr[/mail/e/softbank_ne_jp/1CA], 'HAMSTER FB_SOFTBANK_GMAIL';
like $google,   qr[/mail/e/1C1], 'BEAR FB_EMOJI_GMAIL';
