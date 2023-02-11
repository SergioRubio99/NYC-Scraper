use Mojolicious::Lite -signatures;

get "/:pages" => { pages => 1 } => sub ($c) {
    # $c -> render(text => "Hello !");
};

app->start;
