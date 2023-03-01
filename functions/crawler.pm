package crawler;
use Mojolicious::Lite -signatures;
use functions::getDOM;
use functions::getUser;
use functions::getComments;
use functions::getLink;
use functions::getAge;
use functions::getScore;

use Encode;

sub crawler ($pages) {
    my $DOM = getDOM::getDOM($pages);
    my @articles_arr = ();

    for my $e ( $DOM->at("#pagespace")->next_node->at("td")->at("table")
        ->find(".athing")->each )
    {
        my $title = Encode::decode_utf8 $e->at(".titleline")->at("a")->text;
        push( @articles_arr, { "age" => getAge::getAge($e),
        "title" => $title,
        "user" => getUser::getUser($e),
        "score" => getScore::getScore($e),
        "comments" => getComments::getComments($e),
        "url" => getLink::getLink($e)} );
    }

    return ["PAGE $pages", @articles_arr];
}

return 1;