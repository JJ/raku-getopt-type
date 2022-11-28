use Test;
use Getopt::Type;

subtest {
    my %here;
    sub foo(*%opts where getopt(<force push>)) {
        %here = %opts
    }
    lives-ok { foo(:force) }
    ok %here<force>;
    nok %here<push>;
    lives-ok { foo(:push) }
    nok %here<force>;
    ok %here<push>;
    dies-ok  { foo(:whatever)  }
}, "Check long options";

subtest {
    my %here;
    sub foo(*%opts where getopt(<f|force v|verbose n|never>)) {
        %here = %opts
    }
    sub check-contents {
        ok %here<f>;  ok %here<force>;
        ok %here<v>;  ok %here<verbose>;
        nok %here<n>; nok %here<never>;
    }
    lives-ok { foo(:f, :v) }
    check-contents;
    lives-ok { foo(:f, :verbose) }
    check-contents;
    lives-ok { foo(:force, :v) }
    check-contents;
    lives-ok { foo(:force, :verbose) }
    check-contents;
    lives-ok { foo(:fv) }
    check-contents;
}, "Check long with short options";

subtest {
    sub foo( *%opts where getopt(<l|long s>)) {
        %opts;
    }
    is-deeply foo(:l, :s), foo(:long,:s), "Long and short are the same";
    is-deeply foo(:33l,:22s), %(:33long,:33l,:22s), "Values also OK";
}, "Combined long and short";

done-testing;
