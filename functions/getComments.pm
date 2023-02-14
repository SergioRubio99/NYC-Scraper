package getComments;
use Mojolicious::Lite -signatures;
use Mojo::DOM;


sub getComments ($html_el) {
    if ( $html_el->next_node->at(".age")
        ->next_node->next_node->next_node->next_node )
    {
        my $comments =
          $html_el->next_node->at(".age")
          ->next_node->next_node->next_node->next_node->next_node->next_node
          ->text;
        #eliminate the "comment" word to leave the number:
        $comments =~ s/\scomments//; 
        #sometimes the website gives "discuss", when no comments are published yet. We wliminate it:
        $comments =~ s/discuss//; 
        #convert to number:
        return $comments + 0;
    }
    else {
        return 0;
    }

}

return 1;
