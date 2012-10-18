#!/usr/bin/perl

my $pid = fork();
if (not defined $pid) {
	print "resources not avilable.\n";
} elsif ($pid == 0) {
	print "child\n";
	sleep 5;
	print "child2\n";
	exit(0);
} else {
	print "parent\n";
	waitpid($pid,0);
}
print "bla.\n";
