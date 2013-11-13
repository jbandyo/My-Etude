%% @author Joydip Bandyopadhyay
%% @doc This Function takes a string in ISO date format ("yyyy-mm-dd") and returns the Julian date: the day of the year.
%% @copyright JB Inc.
%% version 1.0

-module(dates).
-export([date_parts/1, julian/1]).

julian(Date) ->
  [Year, Month, Day]  = date_parts(Date),
  DaysList = [31,28,31,30,31,30,31,31,30,31,30,31],
  {Pre, _} = lists:split(Month-1, DaysList),
  case is_leap_year(Year) andalso Month > 2 of
  	true  -> sum(Pre)+Day+1;
  	false -> sum(Pre)+Day
  end.

date_parts(Date) ->
  [Year, Month, Day] = re:split(Date, "-", [{return, list}]),
  [element(1, string:to_integer(Year)), 
   element(1, string:to_integer(Month)), 
   element(1, string:to_integer(Day))].

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0) 
  orelse (Year rem 400 == 0).

sum(List) ->
  Function = fun(Value, Accu) -> Value + Accu end,
  lists:foldl(Function, 0, List).
