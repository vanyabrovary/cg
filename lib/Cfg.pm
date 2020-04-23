package Cfg;

use strict;

use Stt;
use DBI;

BEGIN {
    use Exporter();
    our @ISA    = qw( Exporter      );
    our @EXPORT = qw( $cfg $tpl $db );

    my $path = '/var/www/ttg/cg/';

    my %cfg  = ( 
	db      => 'ttg',
	db_pass => 'gtt',
	root => $path, 
	tpl  => { 
	    from => $path.'tpl/from', 
	      to => $path.'tpl/to' 
	} 
    );

    our $cfg = \%cfg;
    our $tpl = Stt->instance({ INCLUDE_PATH => $cfg->{tpl}->{from}, OUTPUT_PATH  => $cfg->{tpl}->{to} }) or die "CAN'T OPEN TT";
    our $db = DBI->connect( "DBI:Pg:dbname=".$cfg->{db}.";host=127.0.0.1;database=".$cfg->{db}, $cfg->{db}, $cfg->{db_pass} ) or die "CAN'T CONNECT TO DB";
}

## dirs ##
# /var/bin/encrypt
# /var/bin/encrypt
# /etc/letsencrypt/configs
# /etc/nginx/sites-enabled

1;
