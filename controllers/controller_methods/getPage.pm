package getPage;
require functions::crawler;
require functions::getDOM;


sub getPage {
    return crawler::crawler();
}

return 1