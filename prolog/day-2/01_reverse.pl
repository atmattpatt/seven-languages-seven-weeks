flip([], []).
flip([Head], [Head]).
flip([Head|Tail], List) :- flip(Tail, FlippedTail), append(FlippedTail, [Head], List).

