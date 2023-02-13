BEGIN {
  unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER';
}


package crawler;
use Mojolicious::Lite;
use Mojo::DOM;
use Mojo::Base -base;
use functions::getArticle;
use functions::getDOM;


sub crawler {
    # my $object = article_constructor -> emit(1,2);
    # say $object;
    # say $object -> emit;

    my $DOM = getDOM::getDOM();
 
    my @upperArr = getArticle::getArticle($DOM);
    return @upperArr;
}

return 1;