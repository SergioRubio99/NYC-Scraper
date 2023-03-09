# NYC-Scraper

Hi! 

This is a web scraper of the website https://news.ycombinator.com/, made with Perl and the minimalist web framework Mojolicious::Lite.


<h1>Set up:</h1>

### Using Docker:

Use the following command, in the project folder, to build the image:
 - `docker image build -t perlscraper .`
 <br>
 
Use the following command to run the image on the 3000 port:
<br>
- ` docker container run --rm -it -p 3000:3000 --name node perlscraper `


### Without using a container service:

Dependencies: 

- Mojolicious::Lite
- CHI
- JSON::Parse
- Test2::V0
- Moose

I recommend using cpan minus to install this modules from the CPAN. 

On Arch, you can install it from the AUR: https://archlinux.org/packages/community/any/cpanminus/

On Debian, you can install it via `apt`, with `sudo apt-get -y install cpanminus`

If you get an error regarding `x86_64-linux-gnu-gcc`, in a Debian-based machine, I recommend installing the package `build-essential`.

Once it is installed on your system, you can download and install the modules, with `cpanm Mojolicious::Lite CHI JSON::Parse Test2::V0 Moose`


<h1>Run:</h1>

This applications uses de `prefork` command, included in the Mojolicious frameork, to run using several workers, in paralell. If you don't use this option, the app will run as well, but not using parallelization.

Execute `perl index.pl prefork` to launch it

The app uses a local cache, stored locally during the time of execution, and deleted immediately after sending the `SIGINT` or `SIGTERM` signals to the app —this is, after closing the app—, so every time the app is initialized again, a fresh new disk stored cache will be lift.

<h1>Testing</h1>

To run the test, run `tests/tests.pl` with `perl tests/tests.pl` in the main project directory.

The app was developed with some tests in mind. They are located inside the `tests`folder, and they lift their own server instance so there's no need to launch the app when running them. 

They test, in every article given:

 - If the data inside the `url` field is a valid URL.
 - If the data inside the `age` field is a number with the word `hours` or the word `minutes`
 - If the data inside the `title` field is at lest, a string 3 characters long.
 - If the data inside the `user` field is at least an existing string.
 - If the data insite the `score` field is a number.
 - If the data inside the `comments` field is a valid number.
