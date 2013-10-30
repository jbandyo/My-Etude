%% @author Joydip Bandyopadhyay
%% @doc This Function takes a string in ISO date format ("yyyy-mm-dd") and returns a list of integers in the form [yyyy, mm, dd].
%% @copyright JB Inc.
%% version 1.0

-module(dates).
-export([date_parts/1]).

date_parts(Date) ->
  [Year, Month, Day] = re:split(Date, "-", [{return, list}]),
  [element(1, string:to_integer(Year)), 
   element(1, string:to_integer(Month)), 
   element(1, string:to_integer(Day))].