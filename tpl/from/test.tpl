[% itm.class %]
[% itm.table %]

[% FOREACH item = itm.info %]

    [% IF item.column_name == 'is_public' %] [% END %]

    [% item.column_name %]
    [% item.data_type   %]

    [% "," UNLESS loop.last %] 

[% END %]

[% USE Dumper %]
[% Dumper.dump(itm.info) %]

