package article;
use Moose;

 
has 'age' => (is => 'rw');
has 'title' => (is => 'rw');
has 'user' => (is => 'rw');
has 'comments' => (is => 'rw');
has 'url' => (is => 'rw');
has 'score' => (is => 'rw');


return 1;