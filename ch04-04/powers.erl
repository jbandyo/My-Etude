%% @author Joydip Bandyopadhyay
%% @doc Implementation of powers function.
%% @copyright JB Inc.
%% version 1.0

-module(powers).
-export([raise/2]).

%% @doc Raises a number to an integer power.

-spec(raise(number(), number()) -> number()).

raise(_, N) when N == 0 -> 1;
raise(X, N) when N < 0  -> 1/raise(X, -N);
raise(X, N) when N > 0  -> raise(X, N, 1).

%% @doc Internal raise function with accumulator.

-spec(raise(number(), number(), number()) -> number()).

raise(_, N, A) when N == 0 -> A;
raise(X, N, A) when true -> raise(X, N-1, X * A).

  