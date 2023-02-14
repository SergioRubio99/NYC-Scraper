package getPage;
require functions::crawler;
require functions::getDOM;
use Mojolicious::Lite -signatures;


sub getPage ($pages) {
    return crawler::crawler($pages);
}

return 1