%% @author Joydip Bandyopadhyay
%% @doc This Function takes a list of numbers as its argument and returns the smallest value.
%% @copyright JB Inc.
%% version 1.0

-module(stats).
-export([minimum/1, maximum/1, range/1]).

range(List) ->
  Min = minimum(List),
  Max = maximum(List),
  [Min, Max].
  
minimum(List) ->
  [First | Remaining] = List,
  minimum(List, First).

maximum(List) ->
  [First | Remaining] = List,
  maximum(List, First).

minimum([], MinSoFar) -> MinSoFar;

minimum(List, MinSoFar) ->
  [Head | Remaining] = List,
  if
  	Head < MinSoFar -> minimum(Remaining, Head);
    Head >= MinSoFar -> minimum(Remaining, MinSoFar)
  end.

maximum([], MinSoFar) -> MinSoFar;

maximum(List, MaxSoFar) ->
  [Head | Remaining] = List,
  if
  	Head >= MaxSoFar -> maximum(Remaining, Head);
    Head < MaxSoFar -> maximum(Remaining, MaxSoFar)
  end.
