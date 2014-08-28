use strict;
use warnings;
use utf8;
use File::Basename;
use Data::Dumper;

my (%hash,);

my	$in1_in = "data2.txt";
open  my $in1, '<', $in1_in or die "Fail open $in1_in file\n";
while(my $line=<$in1>)
{
	chomp $line;
	my @infor=split/\s+/,$line;
	$hash{$infor[0]}=$infor[1];
}
close  $in1;


my	$out_out = "data3.txt";
open  my $out, '>', $out_out or die  "Fail open $out_out\n";
my	$in_in = "data1.txt";
open  my $in, '<', $in_in or die "Fail open $in_in file\n";
while(my $line=<$in>)
{
	chomp $line;
	my @infor=split/\s+/,$line;
	foreach my $infor (@infor)
	{
		print $out "$infor\t";
	}
	if (exists $hash{$infor[0]})
	{
		print $out "$hash{$infor[0]}\n";
	}
	else
	{
		print $out "8\n";
	}
}
close  $in;
close  $out;
