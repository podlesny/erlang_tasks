-module(lesson2_task14).
-export([duplicate/1]).

% Main function: Duplicates each element in the list.
duplicate(List) -> duplicate_helper(List, []).

% Base case: When the list is empty, return the accumulated result.
duplicate_helper([], Acc) -> reverse(Acc);

% Recursive case: Duplicate the head and add both to the accumulator.
duplicate_helper([Head | Tail], Acc) ->
    duplicate_helper(Tail, [Head, Head | Acc]).

% Helper function to reverse a list.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).
