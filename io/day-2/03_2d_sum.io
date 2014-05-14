List deep_sum := method((call target) flatten sum)

deep_list := list(
  list(1, 2, 3, 4),
  list(5, 6, 7, 8),
  list(9, 10, 11, 12)
)

"Sum of deep_list is..." println
deep_list reduce(list+) println
(deep_list deep_sum) println

