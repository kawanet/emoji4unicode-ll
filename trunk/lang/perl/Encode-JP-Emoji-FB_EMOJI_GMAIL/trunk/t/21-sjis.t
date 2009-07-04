use strict;
use warnings;
use Test::More;
use Encode;
use Encode::JP::Emoji;
use Encode::JP::Emoji::FB_EMOJI_GMAIL;

plan tests => 16;

my $text;

$text = "\xF8\x9F";
Encode::from_to($text, 'x-sjis-emoji-docomo', 'x-sjis-emoji-none', FB_DOCOMO_GMAIL());
like $text, qr[/mail/e/docomo_ne_jp/000], 'SUN FB_DOCOMO_GMAIL';

$text = "\xF6\x60";
Encode::from_to($text, 'x-sjis-emoji-kddiapp', 'x-sjis-emoji-none', FB_KDDIAPP_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/000], 'SUN FB_KDDIAPP_GMAIL';

$text = "\xF6\x60";
Encode::from_to($text, 'x-sjis-emoji-kddiweb', 'x-sjis-emoji-none', FB_KDDIWEB_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/000], 'SUN FB_KDDIWEB_GMAIL';

$text = "\xF9\x8B";
Encode::from_to($text, 'x-sjis-emoji-softbank3g', 'x-sjis-emoji-none', FB_SOFTBANK_GMAIL());
like $text, qr[/mail/e/softbank_ne_jp/000], 'SUN FB_SOFTBANK_GMAIL';

$text = "\xF9\x7D";
Encode::from_to($text, 'x-sjis-emoji-docomo', 'x-sjis-emoji-none', FB_DOCOMO_GMAIL());
like $text, qr[/mail/e/docomo_ne_jp/B82], 'KEY FB_DOCOMO_GMAIL';

$text = "\xF6\xF2";
Encode::from_to($text, 'x-sjis-emoji-kddiapp', 'x-sjis-emoji-none', FB_KDDIAPP_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/B82], 'KEY FB_KDDIAPP_GMAIL';

$text = "\xF6\xF2";
Encode::from_to($text, 'x-sjis-emoji-kddiweb', 'x-sjis-emoji-none', FB_KDDIWEB_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/B82], 'KEY FB_KDDIWEB_GMAIL';

$text = "\xF9\x80";
Encode::from_to($text, 'x-sjis-emoji-softbank3g', 'x-sjis-emoji-none', FB_SOFTBANK_GMAIL());
like $text, qr[/mail/e/softbank_ne_jp/B82], 'KEY FB_SOFTBANK_GMAIL';

####

$text = "\xF8\x9F";
Encode::from_to($text, 'x-sjis-emoji-docomo', 'x-sjis-emoji-none', FB_DOCOMO_GMAIL());
like $text, qr[/mail/e/docomo_ne_jp/000], 'SUN FB_DOCOMO_GMAIL';

$text = "\xF6\x60";
Encode::from_to($text, 'x-sjis-emoji-kddiapp', 'x-sjis-emoji-none', FB_KDDIAPP_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/000], 'SUN FB_KDDIAPP_GMAIL';

$text = "\xF6\x60";
Encode::from_to($text, 'x-sjis-emoji-kddiweb', 'x-sjis-emoji-none', FB_KDDIWEB_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/000], 'SUN FB_KDDIWEB_GMAIL';

$text = "\xF9\x8B";
Encode::from_to($text, 'x-sjis-emoji-softbank3g', 'x-sjis-emoji-none', FB_SOFTBANK_GMAIL());
like $text, qr[/mail/e/softbank_ne_jp/000], 'SUN FB_SOFTBANK_GMAIL';

$text = "\xF9\x7D";
Encode::from_to($text, 'x-sjis-emoji-docomo', 'x-sjis-emoji-none', FB_DOCOMO_GMAIL());
like $text, qr[/mail/e/docomo_ne_jp/B82], 'KEY FB_DOCOMO_GMAIL';

$text = "\xF6\xF2";
Encode::from_to($text, 'x-sjis-emoji-kddiapp', 'x-sjis-emoji-none', FB_KDDIAPP_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/B82], 'KEY FB_KDDIAPP_GMAIL';

$text = "\xF6\xF2";
Encode::from_to($text, 'x-sjis-emoji-kddiweb', 'x-sjis-emoji-none', FB_KDDIWEB_GMAIL());
like $text, qr[/mail/e/ezweb_ne_jp/B82], 'KEY FB_KDDIWEB_GMAIL';

$text = "\xF9\x80";
Encode::from_to($text, 'x-sjis-emoji-softbank3g', 'x-sjis-emoji-none', FB_SOFTBANK_GMAIL());
like $text, qr[/mail/e/softbank_ne_jp/B82], 'KEY FB_SOFTBANK_GMAIL';
