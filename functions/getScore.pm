package getScore;
use Mojolicious::Lite -signatures;


sub getScore ($html_el) {
    if($html_el -> next_node -> at(".score")){
        my $score = $html_el -> next_node -> at(".score") -> text;
        $score =~ s/\spoints//;
        return $score+0;
    }
    return 0;
}


return 1;
