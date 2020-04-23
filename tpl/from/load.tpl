var theme = 'material';

$(document).ready(function () {
    var template = [
    ];
});



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



[% BLOCK option   %]
{
    bind:       'state',
    type:       'option',
    label:      'State',
    required:    true,
    labelWidth: '80px',
    width:      '250px',
    component:  'jqxDropDownList',
    options: [
        { value: 'California' },
        { value: 'New York'},
        { value: 'Oregon'},
        { value: 'Illinois'},
        { value: 'Texas'}
    ]
},
[% END %]



[% BLOCK text   %]
{
    bind:         'firstName',
    label:        'First name',
    info:         'Enter first name',
    type:         'text',
    required:     true,
    labelWidth:   '80px',
    width:        '250px',
    infoPosition: 'right'
},
[% END %]



[% BLOCK int   %]
{
    bind: 'nubmberBoxValue',
    type: 'number',
    label: 'Number input',
    labelPosition: 'left',
    labelWidth: '30%',
    align: 'left',
    width: '250px',
    required: true
},
[% END %]



[% BLOCK button %]
{
    type: 'blank',
    rowHeight: '10px'
},
columns: 
[
    {
        type: 'button',
        text: 'Sign up',
        width: '90px',
        height: '30px',
        rowHeight: '40px',
        columnWidth: '50%',
        align: 'right'
    }
]
[% END %]


[% BLOCK form %]
            $('#sampleForm').jqxForm({
                template: template,
                value: {
                    firstName:  'John',
                    lastName:   'Scott',
                    address:    '1st Ave SW',
                    company:    'N/A',
                    city:       'San Antonio',
                    state:      'Texas',
                    zip:        '78209'
                },
                padding: { left: 10, top: 10, right: 10, bottom: 10 }
            });
[% END %]
