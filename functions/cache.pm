package cache;
use Mojolicious::Lite -signatures;
use CHI;


system("mkdir functions/cache_storage");
my $cache = CHI->new( driver => 'File', root_dir => 'functions/cache_storage');

sub saveArticle ( $pages, @article ) {
    $cache->set( $pages, @article, "3 minute" );
}

sub getArticle ($pages) {
    return $cache->get($pages);
}

return 1;
