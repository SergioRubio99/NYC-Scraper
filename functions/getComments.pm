package getComments;
use Mojolicious::Lite -signatures;
use Mojo::DOM;
no warnings "uninitialized";

sub getComments ($html_el) {
    if ( $html_el->next_node->at(".age")
        ->next_node->next_node->next_node->next_node )
    {
        my $comments =
          $html_el->next_node->at(".age")
          ->next_node->next_node->next_node->next_node->next_node->next_node
          ->text;

        if(!$comments){
            return 0;
        }
        my ($comments) = $comments =~ /(\d+)\s/;
        #convert to number:
        return $comments + 0;
    }
        return 0;


}

return 1;
