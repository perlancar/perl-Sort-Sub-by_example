package Sort::Sub::by_example;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    return {
        v => 1,
        summary => 'Sort by example',
        args => {
            example => {
                summary => 'Either an arrayref or comma-separated string',
                schema => ['any' => {of=>['array*', 'str*']}],
                req => 1,
                pos => 0,
            },
        },
    };
}

sub gen_sorter {
    require Sort::ByExample;

    my ($is_reverse, $is_ci, $args) = @_;

    die "Reverse sorting not yet supported" if $is_reverse;

    my $example = ref $args->{example} eq 'ARRAY' ?
        [@{$args->{example}}] : [split /\s*,\s*/, $args->{example}];
    $example = [map {lc} @$example] if $is_ci;

    my $cmp = Sort::ByExample->cmp($example);
    #use Data::Dmp; dd $cmp
}

1;
# ABSTRACT:

=for Pod::Coverage ^(gen_sorter|meta)$

=head1 DESCRIPTION

=head1 prepend:SEE ALSO

L<Sort::ByExample>
