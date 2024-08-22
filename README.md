# exercise-trigger-orderno-generation

instead of trigger to generate order no

### create an instead of trigger on Orders table to generate Order Number

In this exercise you have to creata a instead of trigger to generate unique order numbers in the 
given format and insert into `Orders` table.
 
1. Create a table named `Orders` in the following structure. 

OrderNo | CustomerName |      OrderDate     | NetAmount 
--------|--------------|--------------------|----------
char(10)| varchar(40)  | datetime           |  float28 

2. Write a trigger to generate unique order  no and insert the same into `Orders` table.
3. The OrderNo should be in the following format `O240821001` ie. starting with letter `O` followed by `yymmddxxx`.
4. Everyday last three digits should restart from 1.


