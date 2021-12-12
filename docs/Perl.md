# Perl Scripting

## What is Perl ?

- Perl is a programming language
- It's interpreted
- It's designed for text processing
- It's a general-purpose, high-level language
- It's has a simple and flexible syntax
  - Theres more than one way to do it (TMTOWTDI)
  - "Swiss Army chainsaw" of programming languages
- perl is the interpreter for the Perl language

### Command to check perl version

```perl
perl -v
```

### Command to check how perl is compiled

```perl
perl -V
```

### Executing sample perl command

**vi hello.pl**

```perl
#!/usr/bin/perl
# hello.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

print "Hello, World!\n";

```

```perl
perl hello.pl
Hello, World!
```

## Hello world

### Simple hello-world perl script


**vi hello-simple.pl**
```perl
print "Hello, World!\n"
```

```perl
perl hello-simple.pl
Hello, World!
```

### Perl script to read a file

**vi countlines.pl**
```perl
#!/usr/bin/perl
# countlines.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

my $filename = "linesfile.txt"; # the name of the file

open(FH, $filename);    # open the file
my @lines = <FH>;       # read the file
close(FH);              # close the file

my $count = scalar @lines;  # the number of lines in the file
print("There are $count lines in $filename\n");
```

```perl
perl countlines.pl
There are 50 lines in linesfile.txt
```

## perl loop script

**vi countlines2.pl**
```perl
#!/usr/bin/perl
# countlines2.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;
use IO::File;

my $filename = "linesfile.txt"; # the name of the file

# open the file - with simple error reporting
my $fh = IO::File->new( $filename, "r" );
if(! $fh) {
    print("Cannot open $filename ($!)\n");
    exit;
}

# count the lines
my $count = 0;
while( $fh->getline ) {
    $count++;
}

# close and print
$fh->close;
print("There are $count lines in $filename\n");
```

```perl
[root@centos ~]# perl countlines2.pl
There are 50 lines in linesfile.txt
[root@centos ~]# perl countlines2.pl
Cannot open xlinesfile.txt (No such file or directory)
```
## Perl subroutine

**vi countlines3.pl**
```perl
#!/usr/bin/perl
# countlines3.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;
use IO::File;

main(@ARGV);

# entry point
sub main
{
    my $filename = shift || "linesfile.txt";
    my $count = countlines( $filename );
    message("There are $count lines in $filename");
}

# countlines ( filename ) - count the lines in a file
# returns the number of lines
sub countlines
{
    my $filename = shift;
    error("countlines: missing filename") unless $filename;

    # open the file
    my $fh = IO::File->new( $filename, "r" ) or
        error("Cannot open $filename ($!)\n");
    
    # count the lines
    my $count = 0;
    $count++ while( $fh->getline );

    # return the result
    return $count;    
}

# message ( string ) - display a message terminated with a newline
sub message
{
    my $m = shift or return;
    print("$m\n");
}

# error ( string ) - display an error message and exit
sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos ~]# perl countlines3.pl
There are 50 lines in linesfile.txt
[root@centos ~]# perl countlines3.pl
countlines3.pl: Cannot open xlinesfile.txt (No such file or directory)
```

## Perl Doc

```perl
[root@centos ~]# perldoc IO::File
[root@centos ~]# perldoc -f print
```

## Syntax

```perl
#!/usr/bin/perl
# template.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("This is the template.pl exercise file from Perl 5 Essential Training.");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}


```

```perl
[root@centos ~]# perl syntax.pl
This is the template.pl exercise file from Perl 5 Essential Training
```

## Values and Variables

- Values represent data
- Variables contain values
- Perl provides several types of values
  - Integers
  - Strings
  - Scalars
  - Arrays
  - Hashes
  - References
- Perl uses context to determine type

## Numbers

**vi numbers.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

my $decimal = 23456;

main(@ARGV);

sub main
{
    my $decimal = 12345;
    my $octal = 012345;
    my $hex = 0x1ab7;
    my $binary = 0b10101010;
    my $float = 1234.567;
    my $exp = 12.34e56;

    message("decimal is $decimal");
    message("octal is $octal");
    message("hex is $hex");
    message("binary is $binary");
    message("float is $float");
    message("exp is $exp");

}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos ~]# perl numbers.pl
decimal is 12345
octal is 5349
hex is 6839
binary is 170
float is 1234.567
exp is 1.234e+57
```

## Strings

**vi strings.pl**

```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

my $decimal = 23456;

main(@ARGV);

sub main
{
    my $n = 42;
    my $s1 = 'this is a string: $n';
    my $s2 = "this is a string: $n";
    my $s3 = 'this is a string: "$n"';
    my $s4 = "this is a string: \"$n\"";
    my $s5 = q{'this is a string: '$n'};
    my $s6 = qq{'this is a string: "$n"'};
    my $s7 = qq|this is a string: "$n"|;
    my $s8 = "this is a string" . ':' . "this is another string";

    message($s1);
    message($s2);
    message($s3);
    message($s4);
    message($s5);
    message($s6);
    message($s5.' '.$s6);
    message($s8);
    message($s8 . ' ' . $s7)

}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}


```

```perl
[root@centos ~]# perl strings.pl
this is a string: $n
this is a string: 42
this is a string: "$n"
this is a string: "42"
'this is a string: '$n'
'this is a string: "42"'
'this is a string: '$n' 'this is a string: "42"'
this is a string:this is another string
this is a string:this is another string this is a string: "42"
```

## Lists 

**vi lists.pl**

```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    #my @array = ( 1, 2, 3, 4 );
    my @array = ( 1, "two", 3, 4 );
    my ( $one, $two, $three, $four ) = ( 1, 2, 3, 4 );
    message(join(":", @array));
    message($one);
    message($two);
    message($three);
    message($four);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}


```

```perl
1:two:3:4
1
2
3
4
```

**vi lists2.pl**

```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{

    my @array = ( 1, "two", 3, 4 );
    message($array[1]);
    message("there are " . scalar @array . " elements in the array");
}
sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

```

```perl
[root@centos ~]# perl lists2.pl
two
there are 4 elements in the array
```

## Slicing

**vi slices.pl**

```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @array = ( 1 .. 10 );
    message(join(':', @array));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl slices.pl
1:2:3:4:5:6:7:8:9:10
```

**vi slices1.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @array = ( 1 .. 10 );
    message(join(':', @array[1,4,7]));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl slices1.pl
2:5:8
```

**vi slices2.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @array = ( 1 .. 10 );
    message(join(':', @array[0..2,7]));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}
 
sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

```

```perl
[root@centos perls]# perl slices2.pl
1:2:3:8
```

**vi slices3.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @array = ( 1 .. 10 );
    message(join(':', @array[9,3,5]));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}
 
sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

```

```perl
[root@centos perls]# perl slices3.pl
10:4:6
```

## Hashes

**vi hashes.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    message($hash{"that"});
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl hashes.pl
bar
```

**vi hashes1.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" , "foo", "that" , "bar", "other" , "baz" );
    message($hash{"that"});
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl hashes1.pl
bar
```

**vi hashes2.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    message(join(':', keys(%hash)));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl hashes2.pl
other:that:this
```

**vi hashes3.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    message(join(':', sort(values(%hash))));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl hashes3.pl
other:that:this
```

**vi hashes4.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    message(join(':', sort(keys(%hash))));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
perl hashes4.pl
other:that:this
```

**vi hashes5.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    message(join(':', sort(values(%hash))));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl hashes5.pl
bar:baz:foo
```

**vi hashes6.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    foreach my $k ( sort keys %hash ) {
        my $v = $hash{$k};
        message("$k is $v")
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

```perl
[root@centos perls]# perl hashes6.pl
other is baz
that is bar
this is foo
```

## each

**vi each-begin.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = ( "this" => "foo", "that" => "bar", "other" => "baz" );
    while(my ($k, $v) = each %hash) {
        message("$k is $v");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

**vi each-begin1.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my %hash = %ENV;
    while(my ($k, $v) = each %hash) {
        message("$k is $v");
    }
    message("=============================");
    foreach my $k ( sort keys %hash ) {
        my $v = $hash{$k};
        message("$k is $v");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

## undef

**vi undef**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = undef;
    message("x is $x");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

__Output__
```perl
perl undef.pl
Use of uninitialized value $x in concatenation (.) or string at undef.pl line 13.
x is 
```

**vi undef1.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = '';
    message("x is $x");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
**Output**
```perl
# perl undef1.pl
x is 
```

**vi undef2.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = 'value';
    message("x is $x");
    $x = undef;
    message("x is $x");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
**Output**
```perl
perl undef2.pl
x is value
Use of uninitialized value $x in concatenation (.) or string at undef2.pl line 15.
x is 
```

**vi undef3.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = '42';
    if(defined isnum($x)) {
        message("x is a number ($x)");
    }
    else
    {
        message("$x is not a number");
    }
}
sub isnum
{
    my $n = shift;
    return $n unless defined $n;
    if($n =~ /[^0-9]/)
    {
        return undef;
    } 
    else 
    {
        return $n;
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
**output**
```perl
perl undef3.pl
x is a number (42)
```

**vi undef4.pl**
```perl
#!/usr/bin/perl
# variables.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = '0';
    if(isnum($x)) {
        message("x is a number ($x)");
    }
    else
    {
        message("$x is not a number");
    }
}
sub isnum
{
    my $n = shift;
    return $n unless defined $n;
    if($n =~ /[^0-9]/)
    {
        return undef;
    } 
    else 
    {
        return $n;
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

**output**
```perl
perl undef4.pl
0 is not a number
```

## assignments

**vi assignments.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $var = 42;
    message("var is $var");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
**Output**
```perl
perl assignments.pl
var is 42
```

**vi assignments1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $var = "forty-two";
    message("var is $var");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
**Output**
```perl
perl assignments1.pl
var is forty-two
```

**vi assignments2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @var = ( "forty-two", 42, 40 + 2 );
    message( join(":", @var) );
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
**output**
```perl
perl assignments2.pl
forty-two:42:42
```

### Expressions

**vi expressions.pl**

```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = 3 + 7 * 10;
    message($x);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl expressions.pl 
73
```

**vi expressions1.pl**

```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = ( 3 + 7 ) * 10;
    message($x);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

__output__
```perl
[root@centos perls]# perl expressions1.pl 
100
```

**vi expressions2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = 3 + 7  * 10 || message("foo");
    message($x);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

__output__

```perl
[root@centos perls]# perl expressions2.pl 
73
```

**vi expressions3.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = 0 || message("foo");
    message($x);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl expressions3.pl 
foo
1
```

### Blocks

Everything mentioned on curly brackets is block.  

**vi block.pl**
```
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if(1) {
        message("this");
        message("that");
    } else {
        message("This is the template.pl exercise file from Perl 5 Essential Training.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl blocks.pl 
this
that
```

**vi block1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if(0) {
        message("this");
        message("that");
    } else {
        message("This is the template.pl exercise file from Perl 5 Essential Training.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__Output__
```perl
[root@centos perls]# perl blocks1.pl 
This is the template.pl exercise file from Perl 5 Essential Training.
```

**vi block2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if(1) {
        message("this");
        message("that")
    } else {
        message("This is the template.pl exercise file from Perl 5 Essential Training.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

__output__
```perl
[root@centos perls]# perl blocks2.pl
this
that
```
__Note:__ last statement doesn't need to have a semi-colon it is an option.  
But it is a good practise to keep semi-colon  

### Scope

**vi scope.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("This is the template.pl exercise file from Perl 5 Essential Training.");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $m\n");
    exit 0;
}
```
__output__
```perl
perl scope.pl
Global symbol "$m" requires explicit package name at scope.pl line 24.
Execution of scope.pl aborted due to compilation errors.
```
__Note:__ Here it shows error due to `$m` is not declared under subroutine error.  

**vi scope1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

my $m = "this is a variable \$m"; #This is global declaration variables

main(@ARGV);

sub main
{
    message("This is the template.pl exercise file from Perl 5 Essential Training.");
    error("this is an error message");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $m\n");
    exit 0;
}
```
__output__

```perl
perl scope1.pl
This is the template.pl exercise file from Perl 5 Essential Training.
scope1.pl: this is a variable $m
```
__Note:__ Here m global variable is declared outside error subroutine hence there is no errors.

**vi scope2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

my $m = "this is a variable \$m"; #This is global declaration variables

main(@ARGV);

sub main
{
    message("This is the template.pl exercise file from Perl 5 Essential Training.");
    error("this is an error message");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $m = shift || 'unkown error';
    print("$0: $m\n");
    exit 0;
}
```
__Output__
```perl
perl scope2.pl
This is the template.pl exercise file from Perl 5 Essential Training.
scope2.pl: this is an error message
```
__note:__ here m is declared inside the error subroutine, hence error message is displayed.  

## Conditional Statements

### Understanding conditional statement

- Conditionals execute code selectivity  

```perl
if (condition) {
  statement
}
```
- Conditionals may provide alternative code
```perl
if (condition) {
  statement_1
} else {
  statement_2
}
```

- Beginning with version __5.10__, Perl also provides a switch statement
  - Uses given and when
  - Requires the latest version of Perl

**vi examples_if.pl**

```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 1 ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if.pl 
This is true.
```

**vi examples_if1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 0 ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if1.pl
[root@centos perls]# 
```

**vi examples_if2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 142 ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if2.pl
This is true.
```

**Vi examples_if3.pl**

```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( "this is a string" ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if3.pl
This is true.
```


**vi examples_if4.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( "" ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if4.pl
[root@centos perls]# 
```

**vi examples_if5.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( undef ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if5.pl
[root@centos perls]# 
```

**vi examples_if6.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 5 + 5 ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if6.pl
This is true.
```

**vi examples_if7.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 5 - 5 ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if7.pl
[root@centos perls]# 
```

**vi examples_if8.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

use constant {
    TRUE => 1,
    FALSE => ''
};

main(@ARGV);

sub main
{
    if ( TRUE ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if8.pl
This is true.
```

**vi examples_if9.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

use constant {
    TRUE => 1,
    FALSE => ''
};

main(@ARGV);

sub main
{
    if ( FALSE ) {
        message("This is true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_if9.pl
[root@centos perls]# 
```

## else condition

**vi examples_else.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

use constant {
    TRUE => 1,
    FALSE => ''
};

main(@ARGV);

sub main
{
    if ( TRUE ) {
        message("This is true.");
    } else {
        message("This is false.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_else.pl
This is true.
```

**vi examples_else1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

use constant {
    TRUE => 1,
    FALSE => ''
};

main(@ARGV);

sub main
{
    if ( FALSE ) {
        message("This is true.");
    } else {
        message("This is false.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl examples_else1.pl
This is false.
```
### else-if condition

**vi examples_elsif.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 0 ) {
        message("This is true.");
    } elsif ( 1 ) {
        message("But this one is true.");
    } else {
        message("This is not true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

**vi examples_elsif1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    if ( 0 ) {
        message("This is true.");
    } elsif ( 0 ) {
        message("But this one is true.");
    } elsif ( 0 ) {
        message("But this one is true.");
    } elsif ( 0 ) {
        message("But this one is different than the true.");
    } elsif ( 0 ) {
        message("But this one is true.");
    } else {
        message("This is not true.");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

### postfix

**vi example_postfix.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x =42;
    #message("number is in range!") if ( $x > 25 and $x < 100 ); in postfix it is optional to put brackets
    message("number is in range!") if $x > 25 and $x < 100;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_postfix.pl
number is in range!
```

### unless

**vi example_unless.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x =24;
    unless ( $x > 25 and $x < 100 ) {
        message("number is out of range");
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_unless.pl
number is out of range
```

**vi example_unless1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x =24;
    message("number is out of range") unless  $x > 25 and $x < 100;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_unless1.pl 
number is out of range
```

### ternary

**vi example_ternary.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $n =42;
    my $s = ( $n > 25 and $n < 100 ) ? "in range" : "out of range";
    message("number is " . $s);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_ternary.pl
number is in range
```

## Understanding Loops

- Loops are used for repeating code

```perl
while ( condition ) {
	statement1;
	statement2;
}
```

- Perl provides two basic types of loops
  - while/until loops
  - for/foreach loops

### While conditions

**vi example_while.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, "linesfile.txt");
    message("the file is open");
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_while.pl
the file is open
```

**vi example_while1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, "linesfile.txt");
    while( my $line = <FH> ) {
        print $line;
    }
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```
[root@centos perls]# perl example_while1.pl
line1
line2
line3
line4
```

### until condition

**vi example_until.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $line;
    open(FH, "linesfile.txt");
    until( ($line = <FH>) =~ /3/ ) {
        print $line;
    }
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_until.pl 
line 1
line 2
```
**vi linesfile.txt**
```txt
line 1
line 2
line 3
line 4
line 5
```

**vi example_until1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $line;
    open(FH, "linesfile.txt");
    print $line until ($line = <FH>) =~ /3/;
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_until1.pl
line 1
line 2
```

### for_each condition

**vi example_foreach.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = ("one","two","three","four","five");
    foreach my $s (@list) {
        message($s)
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_foreach.pl
one
two
three
four
five
```

**vi example_foreach1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = ("one","two","three","four","five");
    message($_) foreach (@list);
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_foreach1.pl 
one
two
three
four
five
```

### for loop condition

**vi example_for.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = ("one","two","three","four","five");
    my $i;
    for($i =0; $list[$i]; $i++){
        message($list[$i])
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
 perl example_for.pl
one
two
three
four
five
```

**vi example_for1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = ("one","two","three","four","five");
    my $i;
    for($i =0; $list[$i]; $i++){
        message("index is $i " . $list[$i])
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

__output__
```perl
[root@centos perls]# perl example_for1.pl
one
two
three
four
five
```

## control

**vi example_control.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, "linesfile.txt");
    while(my $line = <FH>) {
        print $line;
    }
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_control.pl
line 1
line 2
line 3
line 4
line 5
```

**vi example_control1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, "linesfile.txt");
    while(my $line = <FH>) {
        last if $line =~ /3/;
        print $line;
    }
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_loops_postfix.pl
line 1
line 2
line 3
line 4
line 5
```

### postfix

**vi example_loops_postfix.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    open(FH, "linesfile.txt");
    # print $_ while (<FH>);
    print while (<FH>);
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```
perl example_loops_postfix.pl
line 1
line 2
line 3
line 4
line 5
```

**vi example_loops_postfix1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $line = '';
    open(FH, "linesfile.txt");
    print $line while ( $line = <FH>);
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_loops_postfix1.pl
line 1
line 2
line 3
line 4
line 5
```

**vi example_loops_postfix2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $line = '';
    open(FH, "linesfile.txt");
    print $line = <FH> until ( $line =~ /3/ );
    close FH;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__

```perl
[root@centos perls]# perl example_loops_postfix2.pl
line 1
line 2
line 3
```

**vi example_loops_postfix3.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @list = ('one', 'two', 'three', 'four', 'five');
    print "$_\n" foreach @list;
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_loops_postfix3.pl
one
two
three
four
five
```
## Special variables

__How Perl uses special variables__

- Perl uses special variables for a number of purposes
- Default values for functions and loops
- Error codes and messages
- Information about the system and its environment
- Over 70 special variables
  - Full list in Perl documentation page "perlvar"

|variable|details|
|---|---|
|`$_`|Default input|
|`$1, $2, $3, etc.`|Pattern results|
|`$!`|System error number or string|
|`$@`|eval() error|
|`$$`|Process ID(PID)|
|`@_`|List of arguments for subroutine|
|`@ARGV`|List of command-line arguments|
|`@INC`|List of paths Perl searches for libraries and modules|
|`%ENV`|Hash of environment variables|

### using

**vi example_spc_var.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message(join(':', @ARGV));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_spc_var.pl one two three four five
one:two:three:four:five
```

**vi example_spc_var1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main("six","seven","eight");

sub main
{
    message(join(':', @_));
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_spc_var1.pl one two three four five
six:seven:eight
```

**vi example_spc_var2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main("six","seven","eight");

sub main
{
    foreach ( @_ ) {
        print;
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_spc_var2.pl
sixseveneight
```

**vi example_spc_var3.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main("six","seven","eight");

sub main
{
    foreach $_ ( @_ ) {
        print $_;
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_spc_var3.pl
sixseveneight
```

**vi example_filehandler.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    error("This is the template.pl exercise file from Perl 5 Essential Training.");
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```
 perl example_filehandler.pl
example_filehandler.pl: This is the template.pl exercise file from Perl 5 Essential Training.
```

**vi example_filehandler1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    while(<>){
        print;
    }
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_filehandler1.pl example_filehandler.pl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    error("This is the template.pl exercise file from Perl 5 Essential Training.");
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```

**vi example_filehandler2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    while(<>){
        print "$. $_";
    }
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_filehandler2.pl example_filehandler1.pl
1 #!/usr/bin/perl
2 # statements.pl by Bill Weinman <http://bw.org/contact/>
3 # Copyright (c) 2010 The BearHeart Group, LLC
4 #
5 use strict;
6 use warnings;
7 
8 main(@ARGV);
9 
10 sub main
11 {
12     while(<>){
13         print;
14     }
15 }
16 
17 sub message
18 {
19     my $m = shift or return;
20     print(STDOUT "$m\n");
21 }
22 
23 sub error
24 {
25     my $e = shift || 'unkown error';
26     print(STDERR "$0: $e\n");
27     exit 0;
28 }
```

### constants

**vi example_constants.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("The filename is " . __FILE__);
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_constants.pl
The filename is example_constants.pl
```

**vi example_constants1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("The line number is " . __LINE__);
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_constants1.pl
The filename is 12
```

**vi example_constants2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("The package is " . __PACKAGE__);
}

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```perl
[root@centos perls]# perl example_constants2.pl 
The package is main
```

**vi example_constants3.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("The package is " . __PACKAGE__);
}

__END__

sub message
{
    my $m = shift or return;
    print(STDOUT "$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print(STDERR "$0: $e\n");
    exit 0;
}
```
__output__
```
[root@centos perls]# perl example_constants3.pl
Undefined subroutine &main::message called at example_constants3.pl line 12.
```

## Operators

## Operation Arithmetic

**vi exampleoperation1.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $n = 42 + 12;
    my $ns = 42 - 12;
    my $nm = 42 * 12;
    my $nd = 42 / 12;
    message("The addition number is: " . $n);
    message("The subtraction number is: " . $ns);
    message("The multiplication number is: " . $nm);
    message("The division number is: " . $nd);

    my $ax = 42;
    $ax++;
    message("Post Increment Number: " . $ax);

    my $ay = 42;
    $ay--;
    message("Post Decrement Number: " . $ay);

    my $bx = 42;
    $bx++;
    message("Pre Increment Number: " . $bx);

    my $by = 42;
    $by--;
    message("Pre Decrement Number: " . $by);

    message("==========================");
    my $nypd = 42;
    message("The number is: " . $nypd++);
    message("The number is: " . $nypd);

    message("==========================");
    my $nypc = 42;
    message("The number is: " . ++$nypc);
    message("The number is: " . $nypc);

}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl exampleoperation1.pl
The addition number is: 54
The subtraction number is: 30
The multiplication number is: 504
The division number is: 3.5
Post Increment Number: 43
Post Decrement Number: 41
Pre Increment Number: 43
Pre Decrement Number: 41
==========================
The number is: 42
The number is: 43
==========================
The number is: 43
The number is: 43
```

## comparison

**vi example_comparison.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("=======TRUE CASE=====");

    if(5==5) {
        message("this is true")
    } else {
        message("this is NOT true");
    }

    message("=======FALSE CASE=====");

    if(5!=5) {
        message("this is true")
    } else {
        message("this is NOT true");
    }

    message("=======LESS THAN CASE=====");
    
    if(5 < 6) {
        message("this is less")
    } else {
        message("this is greater");
    }

    message("=======GREATER THAN CASE=====");
    
    if(6 > 5) {
        message("this is greater")
    } else {
        message("this is less");
    }

    message("=======LESS THAN OR EQUAL CASE=====");
    
    if(5 <= 6) {
        message("this is less")
    } else {
        message("this is greater");
    }

    message("=======GREATER THAN OR EQUAL CASE=====");
    
    if(6 => 5) {
        message("this is greater")
    } else {
        message("this is less");
    }

    message("======= eq =====");
    
    if("six" eq "six") {
        message("this is true")
    } else {
        message("this is NOT true");
    }

    message("======= eq =====");
    
    if("four" eq "five") {
        message("this is true")
    } else {
        message("this is NOT true");
    }

    message("======= gt =====");
    
    if("four" gt "five") {
        message("this is true")
    } else {
        message("this is NOT true");
    }

    message("======= lt =====");
    
    if("four" lt "five") {
        message("this is true")
    } else {
        message("this is NOT true");
    }

    message("======= ne =====");
    
    if("four" ne "five") {
        message("this is true")
    } else {
        message("this is NOT true");
    }


}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_comparison.pl
Useless use of a constant (6) in void context at example_comparison.pl line 58.
=======TRUE CASE=====
this is true
=======FALSE CASE=====
this is NOT true
=======LESS THAN CASE=====
this is less
=======GREATER THAN CASE=====
this is greater
=======LESS THAN OR EQUAL CASE=====
this is less
=======GREATER THAN OR EQUAL CASE=====
this is greater
======= eq =====
this is true
======= eq =====
this is NOT true
======= gt =====
this is true
======= lt =====
this is NOT true
======= ne =====
this is true
```
Perl documentation command: `perldoc perlop`  

## Logical

**vi example_logical.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $x = ( 5 == 5 );
    message("x is $x");
    if(1){
        message("this is true");
    } else {
        message("this is NOT true");
    }

    message("\n");
    message("Below with fail to give as false as zero is considered as string in perl!");
    message("\n");
    my $y = ( 5 != 5 );
    message("y is $y");
    if(1){
        message("this is true");
    } else {
        message("this is NOT true");
    }

    message("\n");
    my $z = ( 5 != 5 );
    message("z is '$z'");
    if(1){
        message("this is true");
    } else {
        message("this is NOT true");
    }


    message("\n");
    message("Logical OR");

    if( (5 == 6) || (6 == 7) ){
        message("this is true");
    } else {
        message("this is NOT true");
    }

    message("\n");
    message("Logical AND");

    if( (5 == 6) && (6 == 7) ){
        message("this is true");
    } else {
        message("this is NOT true");
    }

    message("\n");
    message("Logical or in different");

    if( (6 == 6) or (7 == 7) ){
        message("this is true");
    } else {
        message("this is NOT true");
    }

    message("\n");
    message("Logical and in different");

    if( (6 == 6) and (7 == 7) ){
        message("this is true");
    } else {
        message("this is NOT true");
    }

    message("==================================");
    my $s = $ARGV[1] || "default";
    message($s);
    if( (6 == 6) or (7 == 7) ){
        message("this is true");
    } else {
        message("this is NOT true");
    }

}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
 perl example_logical.pl
x is 1
this is true


Below with fail to give as false as zero is considered as string in perl!


y is 
this is true


z is ''
this is true


Logical OR
this is NOT true


Logical AND
this is NOT true


Logical or in different
this is true


Logical and in different
this is true
==================================
default
this is true
```
## Filetest

**vi example_filetest.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @dirlist = <*>;
    foreach my $fn (@dirlist) {
        message($fn);
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```

**vi example_filetest2.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @dirlist = <*>;
    foreach my $fn (@dirlist) {
        if( -f $fn ) {
            message("$fn is a plan file");
        } elsif ( -d $fn ) {
            message("$fn is a directory");
        } else {
            message("$fn is something else");
        }
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
$perl example_filetest2.pl
assignments.pl is a plan file
assignments1.pl is a plan file
assignments2.pl is a plan file
blocks.pl is a plan file
blocks1.pl is a plan file
blocks2.pl is a plan file
conditions.pl is a plan file
countlines.pl is a plan file
countlines2.pl is a plan file
countlines3.pl is a plan file
Directory is a directory
each-begin.pl is a plan file
each-begin1.pl is a plan file
example_comparison.pl is a plan file
example_constants.pl is a plan file
example_constants1.pl is a plan file
example_constants2.pl is a plan file
example_constants3.pl is a plan file
example_control.pl is a plan file
example_control1.pl is a plan file
example_filehandler.pl is a plan file
example_filehandler1.pl is a plan file
example_filehandler2.pl is a plan file
example_filetest.pl is a plan file
example_for.pl is a plan file
example_for1.pl is a plan file
example_foreach.pl is a plan file
example_logical.pl is a plan file
example_loops_postfix.pl is a plan file
example_loops_postfix1.pl is a plan file
example_loops_postfix2.pl is a plan file
example_loops_postfix3.pl is a plan file
example_postfix.pl is a plan file
example_spc_var.pl is a plan file
example_spc_var1.pl is a plan file
example_spc_var2.pl is a plan file
example_spc_var3.pl is a plan file
example_ternary.pl is a plan file
example_unless.pl is a plan file
example_until.pl is a plan file
example_until1.pl is a plan file
example_while.pl is a plan file
example_while1.pl is a plan file
exampleoperation1.pl is a plan file
examples_else.pl is a plan file
examples_else1.pl is a plan file
examples_elsif.pl is a plan file
examples_elsif1.pl is a plan file
examples_if.pl is a plan file
examples_if1.pl is a plan file
examples_if2.pl is a plan file
examples_if3.pl is a plan file
examples_if4.pl is a plan file
examples_if5.pl is a plan file
examples_if6.pl is a plan file
examples_if7.pl is a plan file
examples_if8.pl is a plan file
examples_if9.pl is a plan file
expressions.pl is a plan file
expressions1.pl is a plan file
expressions2.pl is a plan file
expressions3.pl is a plan file
hashes.pl is a plan file
hello-simple.pl is a plan file
hello.pl is a plan file
linesfile.txt is a plan file
lists.pl is a plan file
lists2.pl is a plan file
numbers.pl is a plan file
sample_help.pl is a plan file
scope.pl is a plan file
scope1.pl is a plan file
scope2.pl is a plan file
slices.pl is a plan file
strings.pl is a plan file
syntax.pl is a plan file
undef.pl is a plan file
undef1.pl is a plan file
undef2.pl is a plan file
undef3.pl is a plan file
undef4.pl is a plan file
```

**vi example_filetest3.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my @dirlist = <*>;
    foreach my $fn (@dirlist) {
        if( -f $fn ) {
            my $size = -s $fn;
            message("$fn is a plan file ($size bytes)");
        } elsif ( -d $fn ) {
            message("$fn is a directory");
        } else {
            message("$fn is something else");
        }
    }
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl example_filetest.pl
assignments.pl is a plan file (374 bytes)
assignments1.pl is a plan file (383 bytes)
assignments2.pl is a plan file (403 bytes)
blocks.pl is a plan file (499 bytes)
blocks1.pl is a plan file (499 bytes)
blocks2.pl is a plan file (498 bytes)
conditions.pl is a plan file (0 bytes)
countlines.pl is a plan file (437 bytes)
countlines2.pl is a plan file (529 bytes)
countlines3.pl is a plan file (1053 bytes)
Directory is a directory
each-begin.pl is a plan file (470 bytes)
each-begin1.pl is a plan file (568 bytes)
example_comparison.pl is a plan file (2018 bytes)
example_constants.pl is a plan file (384 bytes)
example_constants1.pl is a plan file (387 bytes)
example_constants2.pl is a plan file (386 bytes)
example_constants3.pl is a plan file (395 bytes)
example_control.pl is a plan file (457 bytes)
example_control1.pl is a plan file (457 bytes)
example_filehandler.pl is a plan file (424 bytes)
example_filehandler1.pl is a plan file (376 bytes)
example_filehandler2.pl is a plan file (384 bytes)
example_filetest.pl is a plan file (643 bytes)
example_for.pl is a plan file (455 bytes)
example_for1.pl is a plan file (474 bytes)
example_foreach.pl is a plan file (413 bytes)
example_logical.pl is a plan file (1853 bytes)
example_loops_postfix.pl is a plan file (395 bytes)
example_loops_postfix1.pl is a plan file (429 bytes)
example_loops_postfix2.pl is a plan file (437 bytes)
example_loops_postfix3.pl is a plan file (414 bytes)
example_postfix.pl is a plan file (510 bytes)
example_spc_var.pl is a plan file (357 bytes)
example_spc_var1.pl is a plan file (370 bytes)
example_spc_var2.pl is a plan file (384 bytes)
example_spc_var3.pl is a plan file (390 bytes)
example_ternary.pl is a plan file (443 bytes)
example_unless.pl is a plan file (411 bytes)
example_until.pl is a plan file (451 bytes)
example_until1.pl is a plan file (432 bytes)
example_while.pl is a plan file (406 bytes)
example_while1.pl is a plan file (431 bytes)
exampleoperation1.pl is a plan file (1200 bytes)
examples_else.pl is a plan file (484 bytes)
examples_else1.pl is a plan file (485 bytes)
examples_elsif.pl is a plan file (496 bytes)
examples_elsif1.pl is a plan file (701 bytes)
examples_if.pl is a plan file (383 bytes)
examples_if1.pl is a plan file (383 bytes)
examples_if2.pl is a plan file (385 bytes)
examples_if3.pl is a plan file (400 bytes)
examples_if4.pl is a plan file (384 bytes)
examples_if5.pl is a plan file (387 bytes)
examples_if6.pl is a plan file (387 bytes)
examples_if7.pl is a plan file (387 bytes)
examples_if8.pl is a plan file (436 bytes)
examples_if9.pl is a plan file (437 bytes)
expressions.pl is a plan file (369 bytes)
expressions1.pl is a plan file (373 bytes)
expressions2.pl is a plan file (388 bytes)
expressions3.pl is a plan file (378 bytes)
hashes.pl is a plan file (498 bytes)
hello-simple.pl is a plan file (24 bytes)
hello.pl is a plan file (168 bytes)
linesfile.txt is a plan file (34 bytes)
lists.pl is a plan file (562 bytes)
lists2.pl is a plan file (456 bytes)
numbers.pl is a plan file (691 bytes)
sample_help.pl is a plan file (414 bytes)
scope.pl is a plan file (414 bytes)
scope1.pl is a plan file (526 bytes)
scope2.pl is a plan file (526 bytes)
slices.pl is a plan file (395 bytes)
strings.pl is a plan file (893 bytes)
syntax.pl is a plan file (412 bytes)
undef.pl is a plan file (369 bytes)
undef1.pl is a plan file (366 bytes)
undef2.pl is a plan file (411 bytes)
undef3.pl is a plan file (642 bytes)
undef4.pl is a plan file (633 bytes)
```

## Range

**vi range.pl**

```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    print foreach ( 1 .. 9 );
    message("\n");
    message("=============");

    print foreach ( 'a' .. 'z' );
    message("\n");
    message("=============");

    print foreach ( 'a' .. 'z', 'A' .. 'Z' );
    message("\n");
    message("=============");

    print foreach ( 0 .. 9, 'a' .. 'f' );
    message("\n");
    message("=============");

    print foreach ( '00' .. '31' );
    message("\n");
    message("=============");

    print join(',',( '00' .. '31' ));
    message("\n");
    message("=============");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl range.pl
123456789

=============
abcdefghijklmnopqrstuvwxyz

=============
abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ

=============
0123456789abcdef

=============
0001020304050607080910111213141516171819202122232425262728293031

=============
00,01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31

=============
```

## concat

**vi concat.pl**
```perl
#!/usr/bin/perl
# statements.pl by Bill Weinman <http://bw.org/contact/>
# Copyright (c) 2010 The BearHeart Group, LLC
#
use strict;
use warnings;

main(@ARGV);

sub main
{
    my $s1 = "string 1";
    my $s2 = "string 2";
    message( $s1 . ' ' . $s2 );
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}
```
__output__
```perl
perl concat.pl
string 1 string 2
```

 
## References

https://perlmaven.com/perl-on-the-command-line  
https://www.thegeekstuff.com/2010/06/perl-command-line-options/  
https://www.thegeekstuff.com/category/perl/  
