-module(lesson2_task05).
-export([reverse/1]).

% Reverse the list by calling an auxiliary function with an accumulator.
reverse(List) -> reverse(List, []).

% Base case: When the list is empty, return the accumulator as the reversed list.
reverse([], Acc) -> Acc;

% Recursive case: Move the head of the list to the accumulator and process the tail.
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).
