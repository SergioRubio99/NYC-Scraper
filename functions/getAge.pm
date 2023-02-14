package getAge;
use Mojolicious::Lite -signatures;
use Mojo::DOM;


sub getAge ($html_el) {
    my $age = $html_el->next_node->at(".age")->at("a")->text;
    if ($age){
        $age =~ s/\sago//;
        return $age;
    }
        return "";
}

return 1;