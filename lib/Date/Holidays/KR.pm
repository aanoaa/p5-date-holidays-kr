package Date::Holidays::KR;
use utf8;
use strict;
use warnings;
use base qw(Exporter);
our @EXPORT = qw(is_kr_holiday kr_holidays);

=encoding utf-8

=head1 NAME

Date::Holidays::KR - Determine KR Public Holidays

=head1 SYNOPSIS

    use Date::Holidays::KR;
    my ($year, $month, $day) = (localtime)[5, 4, 3];
    $year  += 1900;
    $month += 1;
    print "Woohoo" if is_kr_holiday($year, $month, $day);

=head1 SUBROUTINES

=head2 is_kr_holiday( $year, $month, $day )

Returns the name of the Holiday that falls on the given day, or undef
if there is none.

=head2 kr_holidays( $year )

Returns hashref contains whole holidays in C<$year>, each keys are
concatenate string of 2 digit month and 2 digit day

    my $holidays = kr_holidays(2016);
    ## 25th of December is annual Christmas
    print $holidays->{'1225'};    # 기독탄신일

=cut

our %holidays;

$holidays{'2015'}{'01'}{'01'} = $holidays{'2016'}{'01'}{'01'} = '신정';
$holidays{'2015'}{'02'}{'18'} = $holidays{'2016'}{'02'}{'07'} = '설날전날';
$holidays{'2015'}{'02'}{'19'} = $holidays{'2016'}{'02'}{'08'} = '설날';             #음력1월1일
$holidays{'2015'}{'02'}{'20'} = $holidays{'2016'}{'02'}{'09'} = '설날다음날';
$holidays{'2015'}{'03'}{'01'} = $holidays{'2016'}{'03'}{'01'} = '3·1절';
$holidays{'2015'}{'05'}{'05'} = $holidays{'2016'}{'05'}{'05'} = '어린이날';
$holidays{'2015'}{'05'}{'25'} = $holidays{'2016'}{'05'}{'14'} = '석가탄신일';    #음력4월8일
$holidays{'2015'}{'06'}{'06'} = $holidays{'2016'}{'06'}{'06'} = '현충일';
$holidays{'2015'}{'07'}{'17'} = $holidays{'2016'}{'07'}{'17'} = '제헌절';
$holidays{'2015'}{'08'}{'15'} = $holidays{'2016'}{'08'}{'15'} = '광복절';
$holidays{'2015'}{'09'}{'26'} = $holidays{'2016'}{'09'}{'14'} = '추석전날';
$holidays{'2015'}{'09'}{'27'} = $holidays{'2016'}{'09'}{'15'} = '추석';             #음력8월15일
$holidays{'2015'}{'09'}{'28'} = $holidays{'2016'}{'09'}{'16'} = '추석다음날';
$holidays{'2015'}{'09'}{'29'} = '추석대체휴일';
$holidays{'2015'}{'10'}{'03'} = $holidays{'2016'}{'10'}{'03'} = '개천절';
$holidays{'2015'}{'10'}{'09'} = $holidays{'2016'}{'10'}{'09'} = '한글날';
$holidays{'2015'}{'12'}{'25'} = $holidays{'2016'}{'12'}{'25'} = '기독탄신일';

sub is_kr_holiday {
    my ( $year, $month, $day ) = @_;
    return $holidays{$year}{ sprintf '%02d', $month }{ sprintf '%02d', $day };
}

sub kr_holidays {
    my ($year) = @_;
    my $h = {};
    for my $month ( keys %{ $holidays{$year} || {} } ) {
        for my $day ( keys %{ $holidays{$year}{$month} || {} } ) {
            $h->{ sprintf '%02d%02d', $month, $day } = $holidays{$year}{$month}{$day};
        }
    }

    return $h;
}

1;

__END__


=head1 HOLIDAY DATA

http://www.nodong.or.kr/holyday/403063

=head1 SEE ALSO

L<Date::Holidays::UK>, L<Date::Holidays::DK>

=head1 COPYRIGHT

Copyright 2016 Hyungsuk Hong.

This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included with this module.

=cut
