-module(lesson2_task02).
-export([but_last/1]).

% Base case: A list with exactly two elements is returned as it is.
but_last([X, Y]) -> [X, Y];

% Recursive case: Discard the head of the list and process the tail.
but_last([_ | Tail]) -> but_last(Tail).
