use strict;
use warnings;
use lib 't';
use Test::More;
use EncodeUpdate;

plan tests => 4;

# ------------------------------------------------------------------------
    use Encode;
    use Encode::JP::Emoji;
    use Encode::JP::Emoji::FB_EMOJI_GMAIL;

    # DoCoMo Shift_JIS <SJIS+F89F> octets
    # <img src="http://mail.google.com/mail/e/docomo_ne_jp/000" class="e" />
    my $sun = "\xF8\x9F";
    Encode::from_to($sun, 'x-sjis-emoji-docomo', 'x-sjis-emoji-none', FB_EMOJI_GMAIL());

    # KDDI(web) Shift_JIS <SJIS+F665> octets
    # <img src="http://mail.google.com/mail/e/ezweb_ne_jp/001" class="e" />
    my $cloud = "\xF6\x65";
    Encode::from_to($cloud, 'x-sjis-emoji-kddiweb', 'x-sjis-emoji-none', FB_EMOJI_GMAIL());

    # SoftBank UTF-8 <U+E524> string
    # <img src="http://mail.google.com/mail/e/softbank_ne_jp/1CA" class="e" />
    my $hamster = "\x{E524}";
    $hamster = Encode::encode('x-sjis-e4u-none', $hamster, FB_EMOJI_GMAIL());

    # Google UTF-8 <U+FE1C1> octets
    # <img src="http://mail.google.com/mail/e/1C1" class="e" />
    my $bear = "\xF3\xBE\x87\x81";
    $bear = Encode::decode('x-utf8-e4u-none', $bear, FB_EMOJI_GMAIL());
# ------------------------------------------------------------------------

like $sun,     qr[/mail/e/docomo_ne_jp/000],   'SUN FB_DOCOMO_GMAIL';
like $cloud,   qr[/mail/e/ezweb_ne_jp/001],    'CLOUD FB_KDDIWEB_GMAIL';
like $hamster, qr[/mail/e/softbank_ne_jp/1CA], 'HAMSTER FB_SOFTBANK_GMAIL';
like $bear,    qr[/mail/e/1C1],                'BEAR FB_EMOJI_GMAIL';
