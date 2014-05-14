target := Random value(100) floor
input := nil
distance := nil
tries := 0

prompt := method(
  "What is your guess? " print
  File standardInput readLine asNumber
)

input = prompt

while (input != target and tries < 10,
  "You guessted #{input asString}" interpolate println

  new_distance := (target - input) abs
  if (distance != nil) then(
    if(new_distance > distance) then("colder... :(" println) else("hotter... :)" println)
  )

  input = prompt

  distance = new_distance
  tries = tries + 1
)

if (input == target) then("OMG! You guessed that the number was #{target asString}" interpolate println) else("Sorry!  Time's up!" println)

