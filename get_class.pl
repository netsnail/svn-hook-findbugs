#!/usr/bin/perl -w

while($line = <>){
  if ($line =~ /\.java$/) {
    $line =~ /\/(branches|trunk)\/([\w+\._\-]+)\//; 
    $conn = $1; $pro_name = $2;
    $len = length("/".$conn."/".$pro_name);
    $index = index($line, $conn."/$pro_name/");
    $substr = substr($line,$index+$len,-6);
    $index = index($substr, "/");
    $res = substr($substr,$index+1);
    $res =~ s/main\/java\///g;
    $res =~ s/test\/java\///g;
    print $res,",";
  }
}
