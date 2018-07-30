package MYDB;

use strict; 

use DBI;

my $host = q[qa-redlist-db-m1.vega.ironport.com];
my $user = q[qa_super];
my $passwd = q[f1neTu&3];
my $db = q[alutsysh_test];


sub conDB {
  my $dsn   = qq[DBI:mysql:host=$host;database=$db];
  my $dbh   = DBI->connect( $dsn, $user, $passwd, { 'RaiseError'=>0, 'AutoCommit'=>1 } ) or die $DBI::errstr;
  $dbh->do('SET NAMES UTF8');
  return $dbh;
};

sub create_tbl {
	my $tbl_name = shift;
    my $dbh = &conDB();
    my $sql = qq[CREATE TABLE $tbl_name (
                 `key` VARCHAR(32) NOT NULL,
                 `value` VARCHAR(255) NOT NULL,
                 PRIMARY KEY (`key`)
                 ) ENGINE=InnoDB DEFAULT CHARSET=utf8];
    $dbh->do($sql);
};

sub delete_tbl {
    my $tbl_name = shift;
    my $dbh = &conDB();
    my $sql = qq[DROP TABLE IF EXISTS `$tbl_name`];
    $dbh->do($sql);
};

sub insert {
	my ($tbl_name, $key, $val) = @_;
    my $dbh = &conDB();
    my $sql = qq[INSERT IGNORE INTO `$tbl_name` (`key`, `value`) VALUES(?,?)];
    $dbh->do($sql, undef, $key, $val);
};

sub update {
    my ($tbl_name, $key, $val) = @_;
    my $dbh = &conDB();
    my $sql = qq[UPDATE `$tbl_name` SET `value`=? WHERE `key`=?];
    $dbh->do($sql, undef, $val, $key);
};

sub delete {
    my ($tbl_name, $key) = @_;
    my $dbh = &conDB();
    my $sql = qq[DELETE FROM `$tbl_name` WHERE `key`=?];
    $dbh->do($sql, undef, $key);
};

sub select {
    my ($tbl_name, $key) = @_;
    my $dbh = &conDB();
    my $sql = qq[SELECT * from `$tbl_name` WHERE `key`=?];
    my $data = $dbh->selectall_arrayref($sql, undef, $key);
    return $data;
};

sub select_all {
    my $tbl_name = shift;
    my $dbh = &conDB();
    my $sql = qq[SELECT * from `$tbl_name`];
    my $data = $dbh->selectall_arrayref($sql);
    return $data;
};

1;
