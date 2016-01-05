use utf8;
use strict;
use Test::More tests => 5;

use Date::Holidays::KR;

is( is_kr_holiday( 2016, 5,  8 ), undef,       "8th May isn't a Holiday" );
is( is_kr_holiday( 2016, 10, 9 ), '한글날', "9th October is a Holiday, Day of Hangul" );

my $holidays = kr_holidays(2016);
is( keys %$holidays,     16,       '2016 year holidays count' );
is( $holidays->{'1210'}, undef,    "10th December isn't a Holiday" );
is( $holidays->{'0208'}, '설날', '8th February is a Holiday, Day of Seol' );
