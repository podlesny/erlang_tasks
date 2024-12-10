-module(lesson2_task11).
-export([encode_modified/1]).

% Main function: Calls the helper function to encode the list with modifications.
encode_modified(List) -> 
    Encoded = encode_modified_helper(List, [], undefined, 0),
    reverse(Encoded).

% Base case: When the list is empty, finalize the last group and return the result.
encode_modified_helper([], Acc, LastElem, Count) ->
    case Count of
        0 -> Acc; % If no elements were being counted, return the accumulator as is.
        1 -> [LastElem | Acc]; % Single element, append as is.
        _ -> [{Count, LastElem} | Acc] % Multiple occurrences, append as a tuple.
    end;

% Recursive case: Increment the count if the current element matches the last element.
encode_modified_helper([Head | Tail], Acc, Head, Count) ->
    encode_modified_helper(Tail, Acc, Head, Count + 1);

% Recursive case: If the current element is different, finalize the current group.
encode_modified_helper([Head | Tail], Acc, LastElem, Count) ->
    NewAcc = case Count of
        0 -> Acc; % If no elements were being counted, keep the accumulator unchanged.
        1 -> [LastElem | Acc]; % Single element, append as is.
        _ -> [{Count, LastElem} | Acc] % Multiple occurrences, append as a tuple.
    end,
    encode_modified_helper(Tail, NewAcc, Head, 1). % Start a new group with the current element.

% Helper function to reverse a list.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).
