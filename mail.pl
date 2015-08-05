#!/usr/bin/perl -w

use Net::SMTP_auth;

my $to_address  = $ARGV[0];
my $mail_user   = 'findbugs@wcce.cn';
my $mail_pwd    = 'wwmxd';
my $mail_server = '192.168.1.240';

my $from    = "From: $mail_user\n";
my $subject = "Subject: Some Bugs in your code!\n";

my $message = $ARGV[1];


$smtp = Net::SMTP_auth->new($mail_server, Timeout => 120, Debug => 0);
$smtp->auth('LOGIN', $mail_user, $mail_pwd);

$smtp->mail($mail_user);
$smtp->to($to_address);

$smtp->data();
$smtp->datasend($from);
$smtp->datasend($subject);
$smtp->datasend($message);
$smtp->dataend();

$smtp->quit;
