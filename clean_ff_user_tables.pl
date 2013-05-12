#!/home/y/bin/perl -w

my $S_string = qq|
delete from user_history_XX
where lastupdated < date_add(now(), interval -7 day)
and   lastupdated > date_add(now(), interval -30 day)
limit 50000;
|;
my $S_i = 0;
while ($S_i <= 0xff) {
  my $S_hex = sprintf("%02x", $S_i);
  $S_i++;
  $S_sql = $S_string;
  $S_sql =~ s/XX/$S_hex/g;
  print $S_sql,"\n";
}
