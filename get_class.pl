#!/usr/bin/perl -w

while($line = <>){
    if ($line =~ /\.java$/) {
        $line =~ /\/branches\/(\w+)\//; $pro_name = $1;
        $len = length("/branches/".$pro_name);
        $index = index($line, "branches/$pro_name/");
        $substr = substr($line,$index+$len,-6);
        $index = index($substr, "/");
        print substr($substr,$index+1),",";
    }
}
