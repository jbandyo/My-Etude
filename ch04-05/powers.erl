%% @author Joydip Bandyopadhyay
%% @doc Implementation of powers functions.
%% @copyright JB Inc.
%% version 1.0

-module(powers).
-export([raise/2, nth_root/2]).

%% @doc Raises a number to an integer power.

-spec(raise(number(), number()) -> number()).

raise(_, N) when N == 0 -> 1;
raise(X, N) when N < 0  -> 1/raise(X, -N);
raise(X, N) when N > 0  -> raise(X, N, 1).

%% @doc Internal raise function with accumulator.

-spec(raise(number(), number(), number()) -> number()).

raise(_, N, A) when N == 0 -> A;
raise(X, N, A) when true -> raise(X, N-1, X * A).

%% @doc Calculates nth root of a number.

-spec(nth_root(number(), number()) -> number()).

nth_root(X, N) -> nth_root(X, N, X/2.0).

%% @doc Internal helper function for nth_root.

-spec(nth_root(number(), number(), number()) -> number()).

nth_root(X, N, A) ->
  io:format("current guess is ~w ~n", [A]),
  F = raise(A, N) - X,
  Fprime = N * raise(A, N-1),
  Next = A - F/Fprime,
  Change = erlang:abs(Next - A),
  if
  	Change < 1.0e-8 -> Next;
  	true -> nth_root(X, N, Next)
  end.