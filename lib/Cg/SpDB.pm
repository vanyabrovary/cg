package Cg::SpDB;

use Moose;
use Method::Signatures;

use DBI;
use String::CamelCase qw(camelize decamelize);

use Cfg;

has 'tpl' => ( is => 'rw' );

method generate($template, $target, $value) {
    $self->tpl->SetAndGenerate( "$template.tpl", "$target.tpl", {
        itm => {
            class => $value,
            table => decamelize($value),
            info  => $self->columns(decamelize($value))
        }
    } );
}

method list {
    my @tables = $db->tables;
    return \@tables;
}

method columns($table) {
    my @b;
    my $sth = $db->prepare_cached("
        SELECT column_name,
               ordinal_position,
               column_default,
               is_nullable,
               data_type,
               character_maximum_length,
               character_octet_length
          FROM INFORMATION_SCHEMA.COLUMNS
         WHERE table_catalog = '".$cfg->{db}."'
           AND table_name = '$table'
           AND table_schema='public';
        ");
    $sth->execute();
    while ( my $data = $sth->fetchrow_hashref ) { push @b, $data; }
    return  \@b;
}
