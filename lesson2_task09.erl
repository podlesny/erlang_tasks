-module(lesson2_task09).
-export([pack/1]).

% Main function: Calls the helper function and reverses the final result.
pack(List) -> 
    Result = pack_helper(List, [], []),
    reverse(Result).

% Base case: When the input list is empty, finalize the last group and return the result.
pack_helper([], Acc, CurrentGroup) ->
    case CurrentGroup of
        [] -> Acc; % If the current group is empty, return the accumulator as is.
        _ -> [CurrentGroup | Acc] % Otherwise, add the current group to the accumulator.
    end;

% Recursive case: If the head matches the current group, add it to the group.
pack_helper([Head | Tail], Acc, []) ->
    pack_helper(Tail, Acc, [Head]);

pack_helper([Head | Tail], Acc, [CurrentHead | _] = CurrentGroup) ->
    case Head == CurrentHead of
        true -> pack_helper(Tail, Acc, [Head | CurrentGroup]); % Add to the current group.
        false -> pack_helper(Tail, [CurrentGroup | Acc], [Head]) % Finalize the current group, start a new one.
    end.

% Helper function to reverse a list without using built-in functions.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).
