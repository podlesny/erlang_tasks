-module(lesson2_task13).
-export([decode/1]).

% Main function: Decodes the list by processing each tuple.
decode(List) -> decode_helper(List, []).

% Base case: When the input list is empty, return the accumulated result.
decode_helper([], Acc) -> reverse(Acc);

% Recursive case: Expand the tuple {Count, Value} and add it to the result.
decode_helper([{Count, Value} | Tail], Acc) ->
    decode_helper(Tail, append_repeated(Value, Count, Acc)).

% Helper function: Repeats an element `Count` times and appends to an accumulator.
append_repeated(_, 0, Acc) -> Acc;
append_repeated(Value, Count, Acc) -> append_repeated(Value, Count - 1, [Value | Acc]).

% Helper function to reverse a list.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).

