-module(lesson2_task10).
-export([encode/1]).

% Main function: Calls the helper function to encode the list.
encode(List) -> 
    Encoded = encode_helper(List, [], undefined, 0),
    reverse(Encoded).

% Base case: When the list is empty, finalize the last group and return the result.
encode_helper([], Acc, LastElem, Count) ->
    case Count of
        0 -> Acc; % If no elements were being counted, return the accumulator as is.
        _ -> [{Count, LastElem} | Acc] % Otherwise, add the last group to the accumulator.
    end;

% Recursive case: Increment the count if the current element matches the last element.
encode_helper([Head | Tail], Acc, Head, Count) ->
    encode_helper(Tail, Acc, Head, Count + 1);

% Recursive case: If the current element is different, finalize the current group.
encode_helper([Head | Tail], Acc, LastElem, Count) ->
    NewAcc = case Count of
        0 -> Acc; % If no elements were being counted, keep the accumulator unchanged.
        _ -> [{Count, LastElem} | Acc] % Add the finalized group to the accumulator.
    end,
    encode_helper(Tail, NewAcc, Head, 1). % Start a new group with the current element.

% Helper function to reverse a list.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).

