package Date::Holidays::KR;
use utf8;
use strict;
use warnings;
use base qw/Exporter/;
use version; our $VERSION = version->declare("v0.0.1");
our @EXPORT = qw/is_kr_holiday/;

=head1 NAME

Date::Holidays::KR - Determine KR Public Holidays

=head1 SYNOPSIS

    use Date::Holidays::KR;
    my ($year, $month, $day) = (localtime)[5, 4, 3];
    $year  += 1900;
    $month += 1;
    print "Woohoo" if is_kr_holiday($year, $month, $day);

=head1 DESCRIPTION

=head1 SUBROUTINES

=head2 is_kr_holiday( $year, $month, $day )

Returns the name of the Holiday that falls on the given day, or undef
if there is none.

=cut

our %holidays;

$holidays{ 2015, 1,  1 }  = $holidays{ 2016, 1,  1 }  = '신정';
$holidays{ 2015, 2,  18 } = $holidays{ 2016, 2,  7 }  = '설날 전날';
$holidays{ 2015, 2,  19 } = $holidays{ 2016, 2,  8 }  = '설날';             # 음력 1월 1일
$holidays{ 2015, 2,  20 } = $holidays{ 2016, 2,  9 }  = '설날 다음날';
$holidays{ 2015, 3,  1 }  = $holidays{ 2016, 3,  1 }  = '3·1절';
$holidays{ 2015, 5,  5 }  = $holidays{ 2016, 5,  5 }  = '어린이날';
$holidays{ 2015, 5,  25 } = $holidays{ 2016, 5,  14 } = '석가탄신일';    # 음력 4월 8일
$holidays{ 2015, 6,  6 }  = $holidays{ 2016, 6,  6 }  = '현충일';
$holidays{ 2015, 7,  17 } = $holidays{ 2016, 7,  17 } = '제헌절';
$holidays{ 2015, 8,  15 } = $holidays{ 2016, 8,  15 } = '광복절';
$holidays{ 2015, 9,  26 } = $holidays{ 2016, 9,  14 } = '추석 전날';
$holidays{ 2015, 9,  27 } = $holidays{ 2016, 9,  15 } = '추석';             # 음력 8월 15일
$holidays{ 2015, 9,  28 } = $holidays{ 2016, 9,  16 } = '추석 다음날';
$holidays{ 2015, 9,  29 } = '추석 대체휴일';
$holidays{ 2015, 10, 3 }  = $holidays{ 2016, 10, 3 }  = '개천절';
$holidays{ 2015, 10, 9 }  = $holidays{ 2016, 10, 9 }  = '한글날';
$holidays{ 2015, 12, 25 } = $holidays{ 2016, 12, 25 } = '기독탄신일';

sub is_kr_holiday {
    my ( $year, $month, $day ) = @_;
    return $holidays{ $year, $month, $day };
}

1;

__END__


=head1 HOLIDAY DATA

http://www.nodong.or.kr/holyday/403063

=head1 SEE ALSO

L<Date::Holidays::UK>

=head1 COPYRIGHT

Copyright 2016 Hyungsuk Hong.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included with this module.

=cut
