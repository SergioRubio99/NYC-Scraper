package getLink;
use Mojolicious::Lite -signatures;
use Mojo::DOM;


sub getLink ($html_el) {
    my $url = $html_el->at(".titleline")->at("a")->attr('href');
          #I add this conditional, because sometimes the website gives "item?id=34773442" as url:
     if ($url =~ /item\?id/){
        return "https://news.ycombinator.com/$url";
     }
        return $html_el->at(".titleline")->at("a")->attr('href');
}

return 1;
