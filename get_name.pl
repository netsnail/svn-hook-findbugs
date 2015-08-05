#!/usr/bin/perl -w

while($line = <>){
    if ($line =~ /\.java$/) {
        $line =~ /\/(branches|trunk)\/([\w\._]+)\//; 
	if ($2) {
	  print $2;
	  last;
	}
    }
}
