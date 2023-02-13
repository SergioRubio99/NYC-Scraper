BEGIN {
  unshift @INC,'C:\Users\Sergio\Desktop\NYC-SCRAPER';
}


package crawler;
use Mojolicious::Lite;
use Mojo::DOM;
use Mojo::Base -base;
use functions::getDOM;
use functions::getUser;


sub crawler {
    # my $object = article_constructor -> emit(1,2);
    # say $object;
    # say $object -> emit;

    my $DOM = getDOM::getDOM();
 

     my $count    = 0;

    # say "NUMBER, LENGTH OF THE ARTS ARRAY: ";
    # say my $lowerArrScalar = @lowerArr;
    my @upperArr = ();

    my $lol = 0;

    for my $e ( $DOM->at("#pagespace")->next_node->at("td")->at("table")
        ->find(".athing")->each )
    {
        $count = $count + 1;
        my $title = $e->at(".titleline")->at("a")->text;
        my $link  = $e->at(".titleline")->at("a")->attr('href');
        my $user  = getUser::getUser($e);
        my $age   = $e->next_node->at(".age")->at("a")->text;
        # my $comments =
        #   $e->next_node->at(".age")
        #   ->next_node->next_node->next_node->next_node->next_node->next_node
        #   ->text;
        # my $score   = $e->next_node->at(".score")->text;
        my @artHash = (
            "title"    => $title,
            "user"     => $user,
            "url"      => $link,
            "age"      => $age,
            "comments" => 1,
            "score"    => 1
        );

        foreach my $entry ( values @artHash ) {

            # say "";
            # say $entry;
            # say "";

        }
        push( @upperArr, {@artHash} );
    }

    return @upperArr;
}

return 1;