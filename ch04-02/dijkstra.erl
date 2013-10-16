%% @author Joydip Bandyopadhyay
%% @doc Function to calculate gcd of two numbers
%% @copyright JB Inc.
%% version 1.0

-module(dijkstra).
-export([gcd/2]).

%% @doc Calculates gcd of two numbers using Dijkstra's recursive algorithm.

-spec(gcd(number(), number()) -> number()).

gcd(M, N) when M >= 0, N >= 0 ->
  if
    M == N -> M;
    M > N  -> gcd(M-N, N);
    true   -> gcd(M, N-M)
  end.
  