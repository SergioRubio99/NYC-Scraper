BEGIN {
  unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER\functions';
  unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER';
  unshift @INC,'controllers\controller_methods';
  #@INC is the directory list, where perl searches for .pm files
}


use Mojolicious::Lite -signatures;
use controllers::controller;

get "/:pages" => { pages => 1 } => sub ($c) {
    my $pages = $c->param('pages');
    controller::api( $c, "Sebastien", $pages );
    # $c -> render(text => "Hello !");
};

app->start;
