#!/home/y/bin/perl -w

my $S_string = qq|
CREATE TABLE all_user_history (
  itemid int(11) unsigned NOT NULL default '0',
  uid int(11) unsigned NOT NULL default '0',
  lastupdated timestamp(14) NOT NULL,
  unique KEY  (itemid,uid),
  KEY lastupdated (lastupdated)
) TYPE=MyISAM TYPE=MRG_MyISAM UNION=(XX);


|;
    

my $S_i = 0;
while ($S_i <= 0x02) {
  my $S_hex = sprintf("%02x", $S_i);
  $S_table_str .= ",user_history_$S_hex\n";
  $S_i++;
}
$S_table_str =~ s/^,//;
$S_sql = $S_string;

$S_sql =~ s/XX/$S_table_str/g;
print $S_sql,"\n";
