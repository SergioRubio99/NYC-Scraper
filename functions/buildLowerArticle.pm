package buildLowerArticle;
use Mojolicious::Lite -signatures;
use Mojo::DOM;
use utf8;

sub buildLowerArticle ($DOM) {
    my @lowerArr = ();
    for my $e ( $DOM->find('.subline')->each ) {
        my $score = $e->at(".score")->text;
        my $user  = $e->at(".subline>.hnuser")->text;
        my $comment =
          $e->at(".hnuser")
          ->next_node->next_node->next_node->next_node->next_node->next_node
          ->next_node->next_node->text;

      #this regex s/ is needed because of random character present near comments
        $comment =~ s/.(co)/ co/;
        say $comment;
        my $age = $e->at(".age")->at("a")->text;
        say "AGE:";
        say $age;
        push(
            @lowerArr,
            {
                score   => $score,
                user    => $user,
                comment => $comment,
                age     => $age
            }
        );
    }
    return @lowerArr;
}

return 1;
