my_sort([], []).
my_sort([Head|[]], [Head]).
my_sort([Head|[Neck|[]]], Sorted) :- @=<(Head, Neck), append([Head], [Neck], Sorted).
my_sort([Head|[Neck|[]]], Sorted) :- @>(Head, Neck), append([Neck], [Head], Sorted).
my_sort([Head|[Neck|Tail]], Sorted) :-
  my_sort([Neck|Tail], [SortedHead|SortedTail]),
  @=<(Head, SortedHead),
  append([Head, SortedHead], SortedTail, Sorted).
my_sort([Head|Tail], Sorted) :-
  my_sort(Tail, [SortedHead|SortedTail]),
  @>(Head, SortedHead),
  my_sort([Head|SortedTail], SortedOthers),
  append([SortedHead], SortedOthers, Sorted).

