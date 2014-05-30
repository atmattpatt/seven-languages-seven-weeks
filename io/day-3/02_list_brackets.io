OperatorTable addOperator("<<", 13)
OperatorTable addOperator("[]", 14)

Array := list clone

Array << := method(index, self append(index))
Array [] := method(index, self at(index))

fruits := Array clone

fruits << "cherry"
fruits << "blackberry"
fruits << "kiwi"

"Fruit at index 2 is: " print
(fruits [2]) println

"Fruit at index 4 is: " print
(fruits [4]) println

