Introduction
============

JSON (JavaScript Object Notation) is a lightweight data-interchange format. It is easy for humans to read and write. It is easy for machines to parse and generate. It is based on a subset of the JavaScript Programming Language, [Standard ECMA-262 3rd Edition - December 1999](http://www.ecma-international.org/publications/files/ecma-st/ECMA-262.pdf). 

The JSON format is often used for serializing and transmitting structured data over a network connection. It is primarily used to transmit data between a server and web application, serving as an alternative to XML.

For more information, please read: 

[http://json.org/](http://json.org/)  
[http://en.wikipedia.org/wiki/Json](http://en.wikipedia.org/wiki/Json)

Structures: 
===========

Since JSON supports key-value objects, the parser interprets the key-value JSON objects as Scilab ``struct`` objects. 

(Type ``help struct`` in Scilab for more information on Scilab structures.)

Consider the following example:

	{
	  "orderID": 12345,
	  "shopperName": "John Smith",
	  "shopperEmail": "johnsmith@example.com",
	  "contents": [
		{
		  "productID": 34,
		  "productName": "SuperWidget",
		  "quantity": 1
		},
		{
		  "productID": 56,
		  "productName": "WonderWidget",
		  "quantity": 3
		}
	  ],
	  "orderCompleted": true
	}


Assuming the above JSON text is saved in a text file in the current working directory, the text can be loaded into Scilab and parsed thus: 

    json_eg = mgetl("eg_1.json");
    mystruct = JSONParse(json_eg)

This returns the following Scilab structure:

    mystruct  =
 
    orderID: 12345
    shopperName: "John Smith"
    shopperEmail: "johnsmith@example.com"
    contents: [1x2 struct]
    orderCompleted: "%T"

Individual elements in the structure can be accessed thus: 

Example 1:

    -->mystruct.orderID
     ans  =
 
        12345.

Example 2: 

	-->mystruct.contents.productName
	 ans  =
	 
	 
		   ans(1)
	 
	 SuperWidget   
	 
		   ans(2)
	 
	 WonderWidget   

Note that the JSON values of ``true``, ``false`` and ``null`` are represented in Scilab as ``%T``, ``%F`` and ``%Nan``. Since Scilab contains a function called ``null()``, the function will be temporarily redefined by the parser. However, the parser will restore the function after it is done parsing. 

A Note About Matrices
=====================

A special aspect about this particular parser is the way it interprets vectors and matrices: 

JSON of the form:

    "[1, 2, 3, 4, 5]"

is returned as a (row) vector is Scilab, as one might expect. 

JSON of the form:

    "[[1, 2, 3], [4, 5, 6], [7, 8, 9]]"

is returned as a two-dimensional matrix in Scilab: 

    1.    2.    3.  
    4.    5.    6.  
    7.    8.    9.  

as one might expect, since the above JSON is fundamentally an example of a set of arrays within an array. There is currently no support for hypermatrices. If you need them, please add an [issue](http://forge.scilab.org/index.php/p/json/issues/create/) and I'll consider adding support. 

Proceeding with the above convention, a Scilab column vector would be defined in JSON thus: 

    "[[1], [2],  [3], [4]]"

which when parsed, returns this: 

    1.  
    2.  
    3.  
    4. 

Other Notes
===========

* The parser takes into consideration JSON backslash-escapes. Except for the backslash-quote, all other backslash-escapes are left as is as they do not affect Scilab strings. Backslash-quotes are taken into consideration during the parsing process. 
* This version only has a parser. The next major version will include a JSON encoder as well. Suggestions on this are welcome. 
