-module(lesson2_task03).
-export([element_at/2]).

% Base case: If the index is 1, return the head of the list.
element_at([X | _], 1) -> X;

% Recursive case: Decrement the index and continue with the tail.
element_at([_ | Tail], N) when N > 1 -> element_at(Tail, N - 1);

% Handle cases where the index is out of bounds or the list is empty.
element_at(_, _) -> undefined.
