        "/v2/[% itm.class %]": {
            "get": {
                "tags": ["[% itm.table %]"],
                "summary": "[% itm.class %] information",
                "description": "[% itm.class %]. List.",
                "parameters": [],
                "responses": {
                    "200": {
                        "description": "Successful",
                        "schema": { }
                    }
                }
            },
            "post": {
                "tags": ["[% itm.table %]"],
                "summary": " Add/change",
                "description": "[% itm.class %]. Save.",
                "operationId": "[% itm.table %]Save",
                "parameters": [{
[% FOREACH item = itm.info %][% IF item.column_name == 'is_public' %] 
{
"in": "formData",
"name": "is_public",
"type": "boolean",
"description": "active",
"required": false
}
[% END %][% IF item.column_name == 'name' %] 
{
"in": "formData",
"name": "name",
"type": "string",
"description": "[% itm.class %] name",
"required": true
}
[% END %][% IF item.data_type == 'integer' %] 
{
"in": "formData",
"name": "id",
"description": "[% item.column_name %]",
"required": true,
"type": "integer",
"format": "int32"
}
[% END %][%"," UNLESS loop.last %] [% END %]
}],
                "responses": {
                    "200": {
                        "description": "Successful",
                        "schema": { }
                    }
                }
            }
        },
        "/v2/[% itm.class %]/{id}": {
            "get": {
                "tags": ["[% itm.table %]"],
                "summary": "[% itm.class %] information",
                "description": "Strategy data",
                "parameters": [{
                    "in": "path",
                    "name": "id",
                    "description": "Get strategy data by id",
                    "required": true,
                    "type": "integer",
                    "format": "int32"
                }],
                "responses": {
                    "200": {
                        "description": "Successful",
                        "schema": {
                            "$ref": "definitions.json#/strategy"
                        }
                    }
                }
            },
            "delete": {
                "tags": ["[% itm.table %]"],
                "summary": "[% itm.class %] delete",
                "description": "[% itm.class %] delete by id",
                "parameters": [{
                    "in": "path",
                    "name": "id",
                    "description": "Delete [% itm.class %] data by id",
                    "required": true,
                    "type": "integer",
                    "format": "int32"
                }],
                "responses": {
                    "200": {
                        "description": "Successful",
                        "schema": {
                            "$ref": "definitions.json#/strategy"
                        }
                    }
                }
            }
        },
[% #itm.class %]
[% #itm.table %]
[% #USE Dumper %]
[% #Dumper.dump(itm.info) %]
