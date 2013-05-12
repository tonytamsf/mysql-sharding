#!/home/y/bin/perl -w

my $S_string = qq|
CREATE TABLE user_history_XX (
  itemid int(11) unsigned NOT NULL default '0',
  uid int(11) unsigned NOT NULL default '0',
  lastupdated timestamp(14) NOT NULL,
  PRIMARY KEY  (itemid,uid),
  KEY lastupdated (lastupdated),
  KEY uid (uid)
) TYPE=INNODB;
|;


my $S_i = 0;
while ($S_i <= 0xff) {
  my $S_hex = sprintf("%02x", $S_i);
  $S_i++;
  $S_sql = $S_string;
  $S_sql =~ s/XX/$S_hex/g;
  print $S_sql,"\n";
}
