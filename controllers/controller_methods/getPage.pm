BEGIN{
  unshift @INC,'/home/sergio/NYC-Scraper/';
}

package getPage;
require functions::crawler;
require functions::getDOM;
use functions::cache;
use Mojolicious::Lite -signatures;


sub getPage ($pages) {
    # my @crawled = crawler::crawler($pages);
    my @crawled = cache::getArticle($pages);
    say @crawled;
    say $crawled[0];
    if(!defined $crawled[0][0]){
        say "CRAWLING";
        @crawled = crawler::crawler($pages);
        cache::saveArticle($pages, @crawled);
        return @crawled;
    }
    my @fromCache = cache::getArticle($pages);
    say "RETRIEVING FROM THE CACHE";
    say $fromCache[0][0];
    say "RETRIEVING FROM THE CACHE";
    return @crawled;
}

return 1