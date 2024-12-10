-module(lesson2_task15).
-export([replicate/2]).

% Main function: Replicates each element in the list N times.
replicate(List, N) -> replicate_helper(List, N, []).

% Base case: When the list is empty, return the accumulated result.
replicate_helper([], _, Acc) -> reverse(Acc);

% Recursive case: Replicate the head N times and add it to the accumulator.
replicate_helper([Head | Tail], N, Acc) ->
    replicate_helper(Tail, N, replicate_element(Head, N, Acc)).

% Helper function: Replicates an element N times and appends it to the accumulator.
replicate_element(_, 0, Acc) -> Acc;
replicate_element(Element, Count, Acc) -> 
    replicate_element(Element, Count - 1, [Element | Acc]).

% Helper function to reverse a list.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).
