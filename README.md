# Getopt::Type

Forked from [`tadzik`s](https://github.com/tadzik/Getopt-Type) version

## MAIN? Getopt semantics? Why not both?

```raku
use Getopt::Type;

sub MAIN(*%opts where getopt(<f|force v|verbose>)) {
    say "Forcing!"   if %opts<force>;
    say "Verbosing!" if %opts<verbose>;
    say %opts.perl;
}

# try `raku -Ilib README.md -fv thisprog.raku`
```

