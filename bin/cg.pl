use latest;

use FindBin qw/$Bin/;
use lib "$Bin/../lib";

use Term::Choose qw( choose );
use Cfg;

## template for generate
my $templates = &std_files_to_exec( $cfg->{root}.'tpl/from/' );

## data source for template 
my $codegens  = &std_files_to_exec( $cfg->{root}.'lib/Cg/'   );

## for each template
foreach ( @{$templates} ) {

    my $template = $_;

    ## use each codegen
    foreach ( @{$codegens} ) {

        ## take codegen instance
        my $class = "Cg::".$_;
        eval "use $class;";

        ## put Template::Tolkit instance into codegen class
        my $ins = $class->new( { tpl => $tpl } );

        foreach ( @{ &std_list( $ins->list() ) } ) { chomp(); $ins->generate($template, $_, $_ ); }

    }

}

## files list from folder for choose from std
sub std_files_to_exec {
    my $folder = shift;
    say "Variants:";
    my @c;
    foreach ( choose( [ `ls $folder |awk -F. '{print \$1; }'`  ], { justify => 1 } ) ){ chomp(); push @c, $_; }
    return \@c;
}

## array for choose from std
sub std_list {
    my $list = shift;
    say "Variants:";
    my @c;
    foreach ( choose( [@{$list}], { justify => 1 } ) ){ chomp(); push @c, $_; }
    return \@c;
}

1;
