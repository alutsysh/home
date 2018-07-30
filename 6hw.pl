#!perl

use strict;
use Data::Dumper;

use lib "/home/alutsysh/git/home";
use MYDB;

my $tbl_name = qq[test];
my $data;
my $msg = q[Current table info: ];

MYDB::delete_tbl($tbl_name);

print "Create table\n";
MYDB::create_tbl($tbl_name);
$data = MYDB::select_all($tbl_name);
print $msg, "\n", Dumper(\$data);

print "Insert 2 records\n";
MYDB::insert($tbl_name, 1, 1);
MYDB::insert($tbl_name, 2, 2);
$data = MYDB::select_all($tbl_name);
print $msg, "\n", Dumper(\$data);

print "Update item\n";
MYDB::update($tbl_name, 2, 5);
$data = MYDB::select_all($tbl_name);
print $msg, "\n", Dumper(\$data);

print "Delete item\n";
MYDB::delete($tbl_name, 1);
$data = MYDB::select_all($tbl_name);
print $msg, "\n", Dumper(\$data);

exit(0)