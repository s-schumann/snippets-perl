#!/usr/bin/perl
use strict;
use warnings;

use IO::Socket;
my $sip_sock = new IO::Socket::INET (
	PeerAddr => 'localhost',
	PeerPort => 5060,
	Proto => 'udp'
	);
die "Could not create socket: $!\n" unless $sip_sock;
$sip_sock->send("1st test line\n2nd test line");
$sip_sock->send("1st test line
2nd test line

This is a test");
