%% @author Joydip Bandyopadhyay
%% @doc Implementation of powers function.
%% @copyright JB Inc.
%% version 1.0

-module(powers).
-export([raise/2]).

%% @doc Raises a number to an integer power.

-spec(raise(number(), number()) -> number()).

raise(X, N) ->
  if
    N == 0 -> 1;
    N == 1 -> X;
    N > 0  -> X * raise(X, N-1);
    true   -> 1/raise(X, -N)
  end.
  