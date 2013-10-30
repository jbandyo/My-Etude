%% @author Joydip Bandyopadhyay
%% @doc This Function takes a string in ISO date format ("yyyy-mm-dd") and returns the Julian date: the day of the year.
%% @copyright JB Inc.
%% version 1.0

-module(dates).
-export([date_parts/1, julian/1]).

julian(Date) ->
  Parts = date_parts(Date),
  [Year | MonthDay] = Parts,
  [Month | DayOnly] = MonthDay,
  [Day | None] = DayOnly,
  DaysList = [31,28,31,30,31,30,31,31,30,31,30,31],
  case is_leap_year(Year) andalso Month > 2 of
  	true -> julian(Year, Month-1, Day, DaysList, 1);
  	false -> julian(Year, Month-1, Day, DaysList, 0)
  end.

julian(Year, 0, Day, _, Total) ->
  Total + Day;

julian(Year, Month, Day, DaysList, Total) ->
  [NumDays | RemainingList] = DaysList,
  NewTotal = Total + NumDays,
  julian(Year, Month-1, Day, RemainingList, NewTotal).

date_parts(Date) ->
  [Year, Month, Day] = re:split(Date, "-", [{return, list}]),
  [element(1, string:to_integer(Year)), 
   element(1, string:to_integer(Month)), 
   element(1, string:to_integer(Day))].

is_leap_year(Year) ->
  (Year rem 4 == 0 andalso Year rem 100 /= 0) 
  orelse (Year rem 400 == 0).
