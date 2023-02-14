package getDOM;
use Mojo::UserAgent;
use Mojolicious::Lite;

sub getDOM {
    my $plain_html = qx{curl https://news.ycombinator.com/?p=3};
    my $DOM = Mojo::DOM->new($plain_html);
    # say $DOM;
    # say $DOM->find('a')->map('text')->join("\n");
    return $DOM;
}

return 1;
