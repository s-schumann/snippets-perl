#!/usr/bin/perl

use strict;
use warnings;
use DBI;

my $dbhost='HOST';
my $dbport=3306;
my $database='DB';
my $dbuser='USER';
my $dbpassword='PASS';

my $dsn = "DBI:mysql:database=$database;host=$dbhost;port=$dbport";

# Connect to the database.
my $dbh = DBI->connect($dsn, $dbuser, $dbpassword,{'RaiseError' => 1});

# Drop table 'foo'. This may fail, if 'foo' doesn't exist.
# Thus we put an eval around it.
eval { $dbh->do("DROP TABLE foo") };
print "Dropping foo failed: $@\n" if $@;

# Create a new table 'foo'. This must not fail, thus we don't
# catch errors.
$dbh->do("CREATE TABLE foo (id INTEGER, name VARCHAR(20))");

# INSERT some data into 'foo'. We are using $dbh->quote() for
# quoting the name.
$dbh->do("INSERT INTO foo VALUES (1, " . $dbh->quote("Tim") . ")");

# Same thing, but using placeholders
$dbh->do("INSERT INTO foo VALUES (?, ?)", undef, 2, "Jochen");

# Now retrieve data from the table.
my $sth = $dbh->prepare("SELECT * FROM foo");
$sth->execute();
while (my $ref = $sth->fetchrow_hashref()) {
	print "Found a row: id = $ref->{'id'}, name = $ref->{'name'}\n";
}
$sth->finish();

# Disconnect from the database.
$dbh->disconnect();

__END__
