%% @author Joydip Bandyopadhyay
%% @doc This Function takes a list of numbers as its argument and returns the smallest value.
%% @copyright JB Inc.
%% version 1.0

-module(stats).
-export([minimum/1]).

minimum(List) ->
  [First | Remaining] = List,
  minimum(List, First).

minimum([], MinSoFar) -> MinSoFar;

minimum(List, MinSoFar) ->
  [Head | Remaining] = List,
  if
  	Head < MinSoFar -> minimum(Remaining, Head);
    Head >= MinSoFar -> minimum(Remaining, MinSoFar)
  end.
