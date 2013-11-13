%% @author Joydip Bandyopadhyay
%% @doc This function calculates teh derivative of a function at a point. 
%% @copyright JB Inc.
%% version 1.0

-module(calculus).
-export([derivative/2]).

derivative(Function, Point) ->
  Delta = 1.0e-10,
  (Function(Point + Delta) - Function(Point))/Delta.