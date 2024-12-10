-module(lesson2_task08).
-export([compress/1]).

% Wrapper function: Calls the main function with an undefined initial previous value.
compress(List) -> compress(List, undefined).

% Base case: An empty list is returned as is.
compress([], _) -> [];

% Recursive case: Skip the head if it matches the previous element.
compress([Head | Tail], Previous) when Head == Previous -> compress(Tail, Previous);

% Recursive case: Include the head if it is different from the previous element.
compress([Head | Tail], _) -> [Head | compress(Tail, Head)].
