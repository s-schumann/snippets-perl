#!/usr/bin/perl

@array = qw(this is a test foo bar);

$num = "5";

for(1..$num) {
	my $pid = fork();
	if ($pid) {
		# parent
		waitpid($pid,0);
	} elsif ($pid == 0) {
		# child
		print "@array\n";
		exit(0);
	} else {
		die "couldn't fork: $!\n";
	}
	print "*last in for*\n";
}
print "*after for*\n";
