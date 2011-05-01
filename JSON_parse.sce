// A simple JSON parser



function JSON2Struct = JSONParse(JSON)
    true = "%T"
    false = "%F"
    oldnull = null, null = "%Nan" // Backup the null() function and set variable
    
    json_eg_cat = strcat(JSON);
    
    // The following section is required to convert multidimensional 
    // arrays into a rectangular matrix:
    json_eg_cat_sanitized = json_eg_cat
    Occurances = length(regexp(json_eg_cat, "/\],\s*\[/"))
    for i=1:Occurances
        json_eg_cat_sanitized = strsubst(json_eg_cat_sanitized, "/\],\s*\[/", "]; [", 'r')
    end
    
    // The following section replaces JSON delimiters in the sanitized 
    // JSON string with Scilab delimiters and then evaluates the 
    // resulting Scilab string to form a Scilab structure. 
    JSON2StructText = strsubst(strsubst(strsubst(json_eg_cat_sanitized, '{', "struct("), '}', ")"), ':', ',')
    JSON2Struct = evstr(JSON2StructText)
    null = oldnull

endfunction
