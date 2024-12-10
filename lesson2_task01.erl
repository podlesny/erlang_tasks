-module(lesson2_task01).
-export([last/1]).

% Find the last element in the list
last([Element]) -> 
    Element; % Base case: if the list has one element, it is the last element
last([_Head | Tail]) ->
    last(Tail). % Recursive case: traverse to the end of the list
