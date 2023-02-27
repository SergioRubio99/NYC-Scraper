BEGIN {
  use Cwd qw(cwd);
  my $currentDir = cwd;
  unshift @INC,$currentDir, 'functions','controllers/controller_methods','modules','/modules/Moose';
  #@INC is the directory list, where perl searches for .pm files
}

use controllers::controller;
use Mojolicious::Lite -signatures;

get "/:pages" => { pages => 1 } => sub ($c) {
    my $pages = $c->param('pages');
    controller::api( $c, $pages );
    # $c -> render(text => "Hello !");
};

app->start;

END {
  system("rm -r -d functions/cache_storage");
}