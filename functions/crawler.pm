BEGIN {
  unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER';
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
        my @artHash = (
            "title"    => $title,
            "user"     => getUser::getUser($e),
            "url"      => getLink::getLink($e),
            "age"      => getAge::getAge($e),
            "comments" => getComments::getComments($e),
            "score"    => getScore::getScore($e)
        );

        foreach my $entry ( values @artHash ) {

            # say "";
            # say $entry;
            # say "";

        }
        push( @articles_arr, {@artHash} );
    }

    return @articles_arr;
}

return 1;