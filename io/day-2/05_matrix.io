Matrix := List clone

Matrix dim := method(x, y,
  self := (call target)
  list := List clone
  for(j, 1, x, list append(0))
  for(i, 1, y, self append(list clone))
  self
)

Matrix set := method(x, y, value,
  (call target) at(y) atPut(x, value)
)

Matrix get := method(x, y,
  (call target) at(y) at(x)
)

"2 x 5 list..." println
matrix := Matrix clone
matrix dim(2, 5) println

"Set [1,4] to 8..." println
matrix set(1, 4, 8)
matrix println

"Get [1,4]..." println
matrix get(1, 4) println

"Get [1,2]..." println
matrix get(1, 2) println

# Matrix flip (#6)
Matrix flip := method(
  self := (call target)
  new_matrix := Matrix clone
  new_matrix dim(self size, self at(0) size)
  self foreach(i, row,
    row foreach(j, col,
      new_matrix set(i, j, self get(j, i))))
  new_matrix
)

"Flipping matrix..." println
new_matrix := matrix flip
"Original version:" println
matrix println
"Flipped version:" println
new_matrix println

# Write to file and read from file (#7)
Matrix write := method(filename,
  self := (call target)

  f := File with(filename)
  f remove
  f openForUpdating

  self foreach(i, row,
    row foreach(j, col,
      f write(col asString)
      if (j < (row size - 1)) then (f write(",")))
    f write("\n"))

  f close
)

Matrix read := method(filename,
  self := (call target)

  f := File with(filename) openForReading
  i := 0
  f foreachLine(line,
    line split(",") foreach(j, col,
      self set(j, i, col))
    i = i + 1
    )
  f close
)

"Writing matrix to matrix.dat..." println
matrix write("matrix.dat")

"Reading a new matrix from matrix.dat..." println
new_matrix := Matrix clone
new_matrix dim(matrix at(0) size, matrix size)
new_matrix read("matrix.dat")
new_matrix println

