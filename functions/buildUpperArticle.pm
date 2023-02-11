package buildUpperArticle;
use Mojolicious::Lite -signatures;
use Mojo::DOM;
require functions::article_functions::buildLowerArticle;

sub buildUpperArticle ($DOM) {
    my $count = 0;
    my @lowerArr = buildLowerArticle::buildLowerArticle($DOM);
    say "NUMBER, LENGTH OF THE ARTS ARRAY: ";
    say my $lowerArrScalar = @lowerArr;
    my @upperArr = ();

    for my $e ( $DOM->find('span[class="titleline"] > a')->each ) {
        $count = $count + 1;
        my $title = $e -> text;
        my $link = $e->attr('href');
        my $user = $lowerArr[$count]{user};
        my $age = $lowerArr[$count]{age};
        my $comments = $lowerArr[$count]{comment};
        my $score = $lowerArr[$count]{score};
        my @artHash =  ("title"=> $title, "user"=> $user, "url" => $link, "age" => $age, "comments" => $comments,  "score" => $score);

         foreach my $entry (values @artHash) {
            say "";
            say $entry;
            say "";

         };
        push(@upperArr,  {@artHash} );
    }

    return @upperArr;
}

return 1;

