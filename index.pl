BEGIN {
  unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER',
    unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER\controllers\controller_methods'
  #@INC is the directory list, where perl searches for .pm files
}
 

use Mojolicious::Lite -signatures;
require controllers::controller;

get "/:pages" => { pages => 1 } => sub ($c) {
    my $pages = $c->param('pages');
    controller::api( $c, "Sebastien", $pages );
    # $c -> render(text => "Hello !");
};

app->start;
