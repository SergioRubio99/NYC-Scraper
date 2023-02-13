package getUser;
use Mojolicious::Lite -signatures;
use Mojo::DOM;

sub getUser ($html_el) {

    if ( !$html_el->next_node->at(".hnuser") ) {
        my $user = "";
        return $user;
    }
    else {
        my $user = $html_el->next_node->at(".hnuser")->text;
        return $user;
    }
}

return 1;
