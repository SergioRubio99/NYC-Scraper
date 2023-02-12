use strict;
use warnings;
use Mojolicious::Lite -signatures;
use controllers::controller_methods::getPage;

package controller;

sub api ( $c, $name, $pages ) {
    $_ = $pages;
    $_ = 1 unless m/^[1-4]$/;
    my @crawled = getPage::getPage();
    # say @crawled;
    my $ArrRef = \@crawled;
    # say $_;
    # say "Hey! I'm on the top of the application!";
    $c->render( json => $ArrRef );
}

return 1;