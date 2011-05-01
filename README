Introduction
============

JSON (JavaScript Object Notation) is a lightweight data-interchange format. It is easy for humans to read and write. It is easy for machines to parse and generate. It is based on a subset of the JavaScript Programming Language, [Standard ECMA-262 3rd Edition - December 1999](http://www.ecma-international.org/publications/files/ecma-st/ECMA-262.pdf). ssuming the above JSON text is saved in a text file in the current working directory, the text can be loaded into Scilab and parsed thus: 

    json_eg = mgetl("examples/eg_1.json");
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

otity": ome

ns  =

The JSON format is often used for serializing and transmitting structured data over a network connection. It is primarily used to transmit data between a server and web application, serving as an alternative to XML.

For more information, please read: 

[htns(1)
tp://json.org/](http://json.org/)  
uperWidget   


Struns(2)
ctures: 
===========

nderWidget   

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


Since JSON supports key-value objects, the parser interprets the key-value JSON objects as Scilab ``struct`` objects. 

(Type ``help struct`` in Scilab for more information on Scilab structures.)

Codside


pperName": "John Smith",

pperEmail": "johnsmith@example.com",

nt

ntity": 3

mpleted": true

