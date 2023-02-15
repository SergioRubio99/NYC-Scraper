package cache;
use CHI;
use Mojolicious::Lite -signatures;
use Mojo::Base -base;

use CHI;

my $cache = CHI->new( driver => 'Memory', global => 1 );

sub saveArticle ( $pages, @article ) {

    $cache->set( $pages, @article, "1 minute" );
}

sub getArticle ($pages) {

    return $cache->get($pages);

}

return 1;
