-module(lesson2_task04).
-export([len/1]).

% Base case: The length of an empty list is 0.
len([]) -> 0;

% Recursive case: Count the head and process the tail.
len([_ | Tail]) -> 1 + len(Tail).
