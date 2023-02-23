BEGIN {
  unshift @INC,'/home/sergio/NYC-Scraper/';
}


package crawler;
use Mojolicious::Lite -signatures;
use Mojo::DOM;
use Mojo::Base -base;
use functions::getDOM;
use functions::getUser;
use functions::getComments;
use functions::getLink;
use functions::getAge;
use functions::getScore;
use article;

use Encode;

sub crawler ($pages) {

    # my $object = article_constructor -> emit(1,2);
    # say $object;
    # say $object -> emit;

    my $DOM = getDOM::getDOM($pages);

    # say "NUMBER, LENGTH OF THE ARTS ARRAY: ";
    # say my $lowerArrScalar = @lowerArr;
    my @articles_arr = ();

    for my $e ( $DOM->at("#pagespace")->next_node->at("td")->at("table")
        ->find(".athing")->each )
    {
       
        my $title = Encode::decode_utf8 $e->at(".titleline")->at("a")->text;
 
        # my $score   = $e->next_node->at(".score")->text;
       my $article = article->new(
        "age" => getAge::getAge($e),
        "title" => $title,
        "user" => getUser::getUser($e),
        "score" => getScore::getScore($e),
        "comments" => getComments::getComments($e),
        "url" => getLink::getLink($e)
       );

        push( @articles_arr, {"title", $article -> title => "age", $article -> age => "user", $article -> user => "score", $article -> score => "comments", $article -> comments => "url", $article -> url} );
    }

    return ["PAGE $pages", @articles_arr];
}

return 1;