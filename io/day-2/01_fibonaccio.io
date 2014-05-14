# With a loop
fib := method(nth,
  nums := list(0, 1)
  for(i, 1, nth - 1,
    nums append((nums removeFirst) + nums first))
  nums last
)

"With a loop:" println

fib(1) println
fib(4) println

"First 20 fibonacci numbers..." println
for(i, 1, 20, i print; " => " print; fib(i) println)

# Wtih recursion
fib := method(nth,
  if (nth <= 1) then(return nth) else(
    return (call target fib(nth - 1) + call target fib(nth - 2)))
)

"" println
"With recursion:" println

fib(1) println
fib(4) println

"First 20 fibonacci numbers..." println
for(i, 1, 20, i print; " => " print; fib(i) println)

