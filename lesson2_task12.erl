-module(lesson2_task12).
-export([decode_modified/1]).

% Main function: Decodes the list by processing each element.
decode_modified(List) -> decode_modified_helper(List, []).

% Base case: When the input list is empty, return the accumulated result.
decode_modified_helper([], Acc) -> reverse(Acc);

% Recursive case: If the head is a tuple {Count, Value}, expand it.
decode_modified_helper([{Count, Value} | Tail], Acc) ->
    decode_modified_helper(Tail, append_repeated(Value, Count, Acc));

% Recursive case: If the head is a single element, add it to the result.
decode_modified_helper([Head | Tail], Acc) ->
    decode_modified_helper(Tail, [Head | Acc]).

% Helper function: Repeats an element `Count` times and appends to an accumulator.
append_repeated(_, 0, Acc) -> Acc;
append_repeated(Value, Count, Acc) -> append_repeated(Value, Count - 1, [Value | Acc]).

% Helper function to reverse a list.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).

