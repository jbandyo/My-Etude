%% @author Joydip Bandyopadhyay
%% @doc This function filters a list to create a new list. 
%% @copyright JB Inc.
%% version 1.0

-module(listproc).
-export([listmaker/0]).

listmaker() ->
  People = [{"Federico", $M, 22}, {"Kim", $F, 45}, {"Hansa", $F, 30},
    {"Tran", $M, 47}, {"Cathy", $F, 32}, {"Elias", $M, 50}],
  create_list3(People).

create_list(List) ->
  AgedMen = fun({_, Sex, Age}) -> (Sex == $M) and (Age > 40) end,
  lists:filter(AgedMen, List).

create_list2(List) ->
  [{Name, Sex, Age} || {Name, Sex, Age} <- List, (Sex == $M), (Age > 40)].

create_list3(List) ->
  [{Name, Sex, Age} || {Name, Sex, Age} <- List, (Sex == $M) or (Age > 40)].