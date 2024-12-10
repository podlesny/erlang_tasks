-module(lesson2_task06).
-export([is_palindrome/1]).

% Check if the list is equal to its reversed version.
is_palindrome(List) -> List == reverse(List).

% Helper function to reverse the list using an accumulator.
reverse(List) -> reverse(List, []).

reverse([], Acc) -> Acc;
reverse([Head | Tail], Acc) -> reverse(Tail, [Head | Acc]).
