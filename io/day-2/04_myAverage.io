List myAverage := method(
  sum := 0
  (call target) foreach(k, v, if (v type == "Number") then(sum = sum + v) else (Exception raise("Not a number")))
  sum / (call target) size
)

"Average of five 5s..." println
list(5, 5, 5, 5, 5) myAverage println

"Average of first 10 positive integers..." println
list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) myAverage println

"Average of 2 and 4..." println
list(2, 4) myAverage println

# Should raise an exception
"Average of 2 and 'four'" println
list(2, "four") myAverage println

