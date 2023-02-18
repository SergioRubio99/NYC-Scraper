BEGIN {
  unshift @INC,'/home/sergio/NYC-Scraper/functions';
  unshift @INC,'/home/sergio/NYC-Scraper/';
  unshift @INC,'controllers/controller_methods';
  #@INC is the directory list, where perl searches for .pm files
}

  system("rm -r -d functions/cache_storage");

use Mojolicious::Lite -signatures;
use controllers::controller;

get "/:pages" => { pages => 1 } => sub ($c) {
    my $pages = $c->param('pages');
    controller::api( $c, "Sebastien", $pages );
    # $c -> render(text => "Hello !");
};

app->start;
