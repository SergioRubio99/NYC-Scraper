FROM debian:stable-slim
EXPOSE 3000
RUN apt update && apt upgrade && apt install build-essential -y
RUN apt install git -y && apt install cpanminus -y && apt install curl -y && apt install procps -y

COPY . .
RUN cpan Mojolicious::Lite CHI JSON::Parse Test2::V0 LWP::UserAgent 

