%% @author Joydip Bandyopadhyay
%% @doc This function takes a list of 32 lists of six numbers as its input and produces a list 
%% of the tooth numbers that require attention.
%% @copyright JB Inc.
%% version 1.0

-module(teeth).
-export([alert/1]).

alert(DepthsList) ->
  find_alerts(DepthsList, 1, []).

find_alerts([], _, AccuList) -> AccuList;

find_alerts([Head | RemList], ToothNumber, AccuList) ->
  IsAlert = find_alert(Head),
  case IsAlert of
    true -> NewList = AccuList ++ [ToothNumber];
    false-> NewList = AccuList
  end,
  find_alerts(RemList, ToothNumber+1, NewList).

find_alert([]) -> false;

find_alert([Head | RemDepths]) ->
  if
  	Head >= 4 -> true;
  	true      -> find_alert(RemDepths)
  end.