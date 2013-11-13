%% @author Joydip Bandyopadhyay
%% @doc This Module has a number of statistical functions that act on a list.
%% @copyright JB Inc.
%% version 1.0

-module(stats).
-export([minimum/1, maximum/1, range/1, mean/1, stdv/1]).

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

mean(List) ->
  sum(List)/length(List).

stdv(List) ->
  N = length(List),
  Sum = sum(List),
  SqList = [Value*Value || Value <- List],
  SqSum = sum(SqList),
  math:sqrt((N * SqSum - Sum * Sum)/(N * (N-1))).

sum(List) ->
  Function = fun(Value, Accu) -> Value + Accu end,
  lists:foldl(Function, 0, List).

