#!/usr/bin/perl
use strict;
use warnings;

use LWP::UserAgent;
use LWP::ConnCache;
use HTTP::Request::Common;

my $ua = LWP::UserAgent->new (
	agent => 'perl script'
);

$ua->conn_cache(LWP::ConnCache->new());

my $post = $ua->request(
	POST 'http://10.0.0.1',
	Content_Type => 'application/x-www-form-urlencoded',
	Content => 'xml=
	<Title>Push test</Title>
	<Text>This is a test for pushing.</Text>'
);

if ($post->is_success) {
   print $post->content;
}
else {
   print $post->status_line, "\n";
}
