Builder := Object clone
Builder indent_size := 0
Builder indent := method(
  self := call target
  self indent_size = ((self indent_size) + 1)
)
Builder outdent := method(
  self := call target
  self indent_size = ((self indent_size) - 1)
)
Builder tabs := method(
  for(i, 0, ((call target) indent_size) - 1, write("  "))
)

Builder forward := method(
  self := call target
  self tabs
  writeln("<", call message name, ">")
  self indent
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", self tabs; writeln(content))
    )
  self outdent
  self tabs
  writeln("</", call message name, ">"))

Builder ul(
  li("Io"),
  li("Lua"),
  li("JavaScript"))

