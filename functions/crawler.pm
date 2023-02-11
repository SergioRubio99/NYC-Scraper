package crawler;
use Mojolicious::Lite;
use Mojo::DOM;
use Mojo::Base -base;
use functions::article_functions::article_constructor;
require functions::article_functions::buildUpperArticle;


sub crawler {
    # my $object = article_constructor -> emit(1,2);
    # say $object;
    # say $object -> emit;
 
    my @upperArr = (1,2);
    return @upperArr;
}

return 1;