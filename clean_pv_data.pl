#!/home/y/bin/perl -w

my $S_string = qq|
delete from XX
where lastupdated < DATE_ADD(now(), INTERVAL -10 DAY) limit 5000;

|;
    

my $S_sql_1;
my $S_i = 0;
while ($S_i <= 0xff) {
  my $S_hex = sprintf("%02x", $S_i);
  $S_table_str = "user_history_$S_hex\n";
  $S_sql_1 = $S_string;
  $S_sql_1 =~ s/XX/$S_table_str/g;
  $S_sql .= $S_sql_1;
  $S_i++;
}

print $S_sql,"\n";
