BEGIN{
  unshift @INC,'/home/sergio/NYC-Scraper/';
}

package getPage;
require functions::crawler;
require functions::getDOM;
use functions::cache;
use Mojolicious::Lite -signatures;


sub getPage ($page) {
    # my @crawled = crawler::crawler($pages);
    my @crawled = cache::getArticle($page);
    if(!defined $crawled[0][0]){
        say "CRAWLING PAGE $page";
        @crawled = crawler::crawler($page);
        cache::saveArticle($page, @crawled);
        return @crawled;
    }
    my @fromCache = cache::getArticle($page);
    say "$fromCache[0][0] RETRIEVED FROM THE CACHE";
    return @crawled;
}

return 1