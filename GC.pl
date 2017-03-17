#!/usr/bin/perl -w
print "Please type the filename of the DNA sequence date: ";
$dna_filename = <STDIN>;
chomp $dna_filename;
unless (-e $dna_filename) {
    print "File \"$dna_filename\" doesn\'t seem to exist!!\n";
    exit;
}
unless (open(DNAFILE,$dna_filename)) {
   print "Cannot open file \"$dna_filename\"\n\n";
   exit;
}
while (<DNAFILE>) {
  if ($_ =~ m/^>(.*)/){
       @DNA = 
@DNA = <DNAFILE>;
close DNAFILE;
$DNA = join('',@DNA);
$DNA =~ s/\s//g;
$a = 0;
$c = 0;
$g = 0;
$t = 0;
$e = 0;
while ( $DNA =~ /a/ig)   {$a++}
while ( $DNA =~ /c/ig)   {$c++}
while ( $DNA =~ /g/ig)   {$g++}
while ( $DNA =~ /t/ig)   {$t++}
while ( $DNA =~ /[^acgt]/ig)   {$e++}
print "A=$a C=$c G=$g T=$t errors=$e\n";
$outputfile = "countbase";
unless (open(COUNTBASE,">$outputfile")) {
   print"Cannot open flie\n";
   exit;
}
print COUNTBASE	 "A=$a C=$c G=$g T=$t errors=$e\n";
close(COUNTBASE);
exit;
