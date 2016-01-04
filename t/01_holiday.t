use utf8;
use strict;
use Test::More tests => 2;

use Date::Holidays::KR;

is( is_kr_holiday( 2016, 5,  8 ), undef,       "8th May isn't a Holiday" );
is( is_kr_holiday( 2016, 10, 9 ), '한글날', "9th October is a Holiday, Hangul" );
