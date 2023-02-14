package getScore;
use Mojolicious::Lite -signatures;
use Mojo::DOM;


sub getScore ($html_el) {
    my $score = $html_el -> next_node -> at(".score") -> text;
   return $score;
}


return 1;
