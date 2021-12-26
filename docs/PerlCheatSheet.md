## Perl cheats

### Command to install perl modules

```perl
cpan App::cpanminus
```

### Alternative command to install perl modules

```perl
cpanm Module::Name
```

### Alternative command to install perl modules

```perl
cpan -i Geo::IP 
```

### Alternative command to install perl modules

```perl
/usr/bin/perl -MCPAN -e 'install Email::Reply'
```

### command to list modules

```perl
cpan -l
```

### command to install modules from cpan terminal

```perl
# cpan
cpan[1]> m Net::Telnet
cpan[1]> m HTML::Template
```

### alternative to install modules

```perl
perl –MCPAN –e'install <module_name>' 
```

### command line perl program

```perl
perl -e 'print "Hello World\n"'
```

```perl
perl -e 'print "Hello ";' -e 'print "World\n"'
```

```perl
perl -e 'print "Hello ";' -e 'print "World\n"'
```

__command to substitute__

```perl
perl -i -pe 's/\bPHP\b/Perl/g' file.txt
```

__command to backup and substitute__

```perl
perl -i.bak -pe 's/\bPHP\b/Perl/g' file.txt
```

__Alternative commandline__

```perl
perl -i.bak -p -e 's/\bJava\b/Perl/' *.txt
```
