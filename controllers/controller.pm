BEGIN{
  unshift @INC,'/home/sergio/NYC-Scraper/';
}

use strict;
use Mojolicious::Lite -signatures;
use controllers::controller_methods::getPage;

package controller;

sub api ( $c, $pages ) {
  my @crawled;

  for (my $i = 1; $i <= $pages; $i++){
   my @pageArr = getPage::getPage($i);

   for my $aref (@pageArr){
      shift @$aref;
   }

   push(@crawled, @pageArr);
  }
  #We flatten the array and send it:
    my $ArrRef = \@crawled;
    @crawled = map {@$_} @$ArrRef;
    $c->render(json => $ArrRef);
}

return 1;