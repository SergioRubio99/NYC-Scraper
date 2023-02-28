BEGIN {
    system("perl ./index.pl daemon -l http://127.0.0.1:3000 &");
};

sleep(1);

use Test2::V0;
use LWP::UserAgent;
use Scalar::Util qw(reftype);
use JSON::MaybeXS qw(encode_json);
use JSON::Parse 'parse_json';
require HTTP::Request;



my $ua = LWP::UserAgent->new;
my $url = 'http://localhost:3000/1';
my $header = ['Content-Type' => 'application/json; charset=UTF-8'];
my $data = {foo => 'bar', baz => 'quux'};
my $encoded_data = encode_json($data);

my $request = HTTP::Request->new(GET => $url, $header, $encoded_data);
my $response = $ua->request($request);
my @arr = parse_json($response->decoded_content());
my $aref = \@arr;

my $type_ref = reftype(@$aref[0]);   
my $type = reftype($aref );
is($type, 'ARRAY', "Driver returns an array");





my $isURL = 1;
sub testURL {
    for my $a ($arr[0]){
        my $iterations = @$a;
        for(my $i = 0; $i < $iterations; $i++){
        my $url = @$a[$i] -> {url};
        if($url =~ /http/){}else{$isURL = 0};
   
        }
    };
ok($isURL eq 1, "URL field test");
}



sub testTitle {
    my $testTitle = 1;
    for my $a ($arr[0]){
         my $iterations = @$a;
           for(my $i = 0; $i < $iterations; $i++){
            my $title = @$a[$i] -> {title};
            if($title =~ /^.{3}/){}else{
                $testTitle = 0;
                return ok($testTitle eq 1, "Title field test");
                };
      };
       ok($testTitle eq 1, "Title field test");
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
                return ok($testComments eq 1, "Comments field test");
                };
        };
        ok($testComments eq 1, "Comments field test");
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
                return ok($testScore eq 1, "Score field test");
                };
        };
        ok($testScore eq 1, "Score field test");
    };
};


sub testUser {
 my $testUser = 1;
  for my $a ($arr[0]){
         my $iterations = @$a;
         for(my $i = 0; $i < $iterations; $i++){
            my $user = @$a[$i] -> {user};
            if($user =~ /^.{1}/ | !$user){}else{
                $testUser = 0;
                return ok($testUser eq 1, "User field test");
                };
        };
        ok($testUser eq 1, "User field test");
    };
};

sub testAge {
 my $testAge = 1;
  for my $a ($arr[0]){
         my $iterations = @$a;
         for(my $i = 0; $i < $iterations; $i++){
            my $age = @$a[$i] -> {age};
            if($age =~ /(^\d{1,2}\shour)|(\d{1,2}\sminute)|(\d{1,2}\sday)/ | !$age){}else{
                $testAge = 0;
                return ok($testAge eq 1, "Age field test");
                };
        };
        ok($testAge eq 1, "Age field test");
    };
};


testURL();
testTitle();
testScore();
testComments();
testUser();
testAge();
done_testing();

END{
    system('pkill -f "perl ./index.pl daemon"');
}