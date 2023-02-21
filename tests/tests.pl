use Test2::V0;
use feature "say";
use LWP::UserAgent;
use Scalar::Util qw(reftype);
use JSON::MaybeXS qw(encode_json);
use JSON::Parse 'parse_json';
require HTTP::Request;

ok("ala" eq "ala", 'ala test!');

my $not_defined;

is($not_defined, undef, "undefined as expected");

say "alahaaa";

my $ua = LWP::UserAgent->new;
 
my $url = 'http://localhost:3000/1';
my $header = ['Content-Type' => 'application/json; charset=UTF-8'];
my $data = {foo => 'bar', baz => 'quux'};
my $encoded_data = encode_json($data);

my $request = HTTP::Request->new(GET => $url, $header, $encoded_data);
my $response = $ua->request($request);
my @arr = parse_json($response->decoded_content());
my $aref = \@arr;

say scalar @$aref;

my $isURL = 1;
sub testURL {
    for my $a ($arr[0]){
        my $iterations = @$a;
        for(my $i = 0; $i < $iterations; $i++){
        my $url = @$a[$i] -> {url};
        if($url =~ /http/){}else{$isURL = 0};
   
        }
    };
ok($isURL eq 1, "Crawl gives a valid URL");
}



sub testTitle {
    my $testTitle = 1;
    for my $a ($arr[0]){
         my $iterations = @$a;
           for(my $i = 0; $i < $iterations; $i++){
            my $title = @$a[$i] -> {title};
            if($title =~ /^.{3}/){}else{
                $testTitle = 0;
                return ok($testTitle eq 1, "Crawl gives a valid article title");
                };
      };
       ok($testTitle eq 1, "Crawl gives a valid article title");
    };
};

sub testComments {
    my $testComments = 1;
    for my $a ($arr[0]){
         my $iterations = @$a;
         for(my $i = 0; $i < $iterations; $i++){
            my $comments = @$a[$i] -> {comments};
            if($comments =~ /[\d]/){}else{
                $testComments = 0;
                return ok($testComments eq 1, "Crawl gives valid article comments");
                };
        };
        ok($testComments eq 1, "Crawl gives valid article comments");
    };
};

sub testScore {
 my $testScore = 1;
  for my $a ($arr[0]){
         my $iterations = @$a;
         for(my $i = 0; $i < $iterations; $i++){
            my $score = @$a[$i] -> {score};
            if($score =~ /[\d]/){}else{
                $testScore = 0;
                return ok($testScore eq 1, "Crawl gives valid article Score");
                };
        };
        ok($testScore eq 1, "Crawl gives valid article score");
    };
};


sub testUser {
 my $testUser = 1;
  for my $a ($arr[0]){
         my $iterations = @$a;
         for(my $i = 0; $i < $iterations; $i++){
            my $user = @$a[$i] -> {user};
            if($user =~ /^.{3}/ | !$user){}else{
                $testUser = 0;
                return ok($testUser eq 1, "Crawl gives valid article User");
                };
        };
        ok($testUser eq 1, "Crawl gives valid article User");
    };
};



testURL();
testTitle();
testScore();
testComments();
testUser();


    # say "AREF: ";
    # for my $a ($arr[0]){
    #     my $iterations = @$a;
    #     for(my $i = 0; $i < $iterations; $i++){
    #     my $age = @$a[$i] -> {age};
    #     my $title = @$a[$i] -> {title};
    #     my $comments = @$a[$i] -> {comments};
    #     my $score = @$a[$i] ->{score};
    #     my $user = @$a[$i] -> {user};
    #     my $url = @$a[$i] -> {url};
    #     ok($url =~ m/http/);
    #     say $age;
    #     say $title;
    #     say $comments;
    #     say $score;
    #     say $user;
    #     say $url;
    #     say "----";

    #     }
    # };
   my $type_ref = reftype(@$aref[0]);
   say $type_ref eq "ARRAY";
   

my $type = reftype($aref );
say $type eq "ARRAY";
is($type, 'ARRAY', "the response returns an array");



done_testing();
