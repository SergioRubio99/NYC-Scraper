FROM debian:stable-slim
EXPOSE 3000
RUN apt update
RUN apt upgrade
RUN apt install git -y
RUN apt install build-essential -y
RUN apt install cpanminus -y
RUN apt install curl -y
RUN apt install procps -y
#perl-utils perl-list-moreutils perl-data-uuid perl-string-rewriteprefix make


RUN git clone 'https://github.com/SergioRubio99/NYC-Scraper'
RUN cd NYC-Scraper
RUN cpan Mojolicious::Lite CHI JSON::Parse Test2::V0 LWP::UserAgent 

