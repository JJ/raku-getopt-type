# Getopt::Type:auth<zef:jjmerelo> [![Test-install distro](https://github.com/JJ/raku-getopt-type/actions/workflows/test.yaml/badge.svg)](https://github.com/JJ/raku-getopt-type/actions/workflows/test.yaml)

Forked from [`tadzik`s](https://github.com/tadzik/Getopt-Type) version

## MAIN? Getopt semantics? Why not both?

```raku
use Getopt::Type:auth<zef:jjmerelo>;

sub MAIN(*%opts where getopt(<f|force v|verbose>)) {
    say "Forcing!"   if %opts<force>;
    say "Verbosing!" if %opts<verbose>;
    say %opts.raku;
}

```

Save as `thisprog.raku` and try `raku -Ilib thisprog.raku -fv`

## Changes with respect to the original

Mainly cosmetic changes, but also accepts
[this PR](https://github.com/tadzik/Getopt-Type/pulls) that had been there
 for a long time. No functionality changes for the time being.
 
## LICENSE

This work is (c) Tadeusz Sośnierz, with some code by Zoffix ZNet and Alex
 Daniel.
 
It's released under the Artistic License 2.0. See [LICENSE](LICENSE) for
