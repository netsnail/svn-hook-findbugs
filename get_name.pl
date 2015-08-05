#!/usr/bin/perl -w

while($line = <>){
    if ($line =~ /\.java$/) {
        $line =~ /\/(branches|trunk)\/(\w+)\//; 
	$pro_name = $1;
	print $pro_name;
	last;
    }
}
