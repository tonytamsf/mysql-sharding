#!/home/y/bin/perl -w

my $S_string = qq|
drop table user_history_XX;
drop table guest_user_history_XX;
|;


my $S_i = 0x00;
while ($S_i <= 0xff) {
  my $S_hex = sprintf("%02x", $S_i);
  $S_i++;
  $S_sql = $S_string;
  $S_sql =~ s/XX/$S_hex/g;
  print $S_sql,"\n";
}
