#!/usr/bin/perl -w

use File::Basename;
use XML::Simple;
use Data::Dumper;

my $pro_name  = $ARGV[0];

my $xmlfile = ".classpath";
if (-e $xmlfile)
{
  my $userxs = XML::Simple->new();
  my $userxml = $userxs->XMLin($xmlfile);

  print "<Project projectName=\"$pro_name\">\n";
  my @allemployeeT = @{$userxml->{classpathentry}};
  foreach my $employee (@allemployeeT)
  {
    $key = $employee->{"kind"};
    if ($key =~ /src/) { $key = "SrcDir"; }
    elsif ($key =~ /output/) { $key = "Jar"; }
    elsif ($key =~ /lib/) { $key = "AuxClasspathEntry"; }
    elsif ($key =~ /var/) { $key = "AuxClasspathEntry"; }
    next if ($key =~ /con/);

    $value = $employee->{"path"};
    $value =~ s/M2_REPO/\/home\/svn\/.m2\/repository/g;
    print "  <".$key.">".$value."</".$key.">\n";
  } 
  print "</Project>\n";
}
