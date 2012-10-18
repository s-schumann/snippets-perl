#!/usr/bin/perl
use strict;
use warnings;

use IO::Socket;
my $sip_sock = new IO::Socket::INET (
	LocalHost => 'localhost',
	LocalPort => '5060',
	Proto=>'udp'
	);
die "Could not create socket: $!\n" unless $sip_sock;
my $size = 1500;
my $text;
while(1) {
	$sip_sock->recv($text,$size);
    if($text ne '') {
		print "\nReceived message '", $text,"'\n";
	}
}
