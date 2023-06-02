use strict;
use warnings;
use File::Copy;

my $directory = "path/to/directory";
my $pattern = "new_name_";

opendir(my $dh, $directory) or die "Cannot open directory: $!";
my @files = readdir($dh);
closedir($dh);

foreach my $file (@files) {
    next if ($file =~ /^\./); # Skip hidden files or directories

    my $old_name = "$directory/$file";
    my $new_name = "$directory/$pattern$file";

    move($old_name, $new_name) or die "Failed to rename $file: $!";
    print "Renamed $file to $new_name\n";
}
