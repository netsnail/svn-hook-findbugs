#!/usr/bin/perl -w

while($line = <>){
  if ($line =~ /\.java$/) {
    $line =~ /\/(branches|trunk)\/(\w+)\//; 
    $conn = $1; $pro_name = $2;
    $len = length("/".$conn."/".$pro_name);
    $index = index($line, $conn."/$pro_name/");
    $substr = substr($line,$index+$len,-6);
    $index = index($substr, "/");
    print substr($substr,$index+1),",";
  }
}
