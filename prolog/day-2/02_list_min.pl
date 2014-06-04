list_min([Head|[]], Head).
list_min([Head|Tail], Min) :- list_min(Tail, TailMin), @=<(TailMin, Head), Min is TailMin.
list_min([Head|Tail], Min) :- list_min(Tail, TailMin), @>(TailMin, Head), Min is Head.

