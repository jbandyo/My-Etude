%% @author Joydip Bandyopadhyay
%% @doc
%% @copyright JB Inc.
%% version 1.0

-module(player).
-export([play/1]).

play({From, Id, Deck}) ->
 %io:format("I am ~p~n", [Id]),
 
 receive
 	yourTurn -> 
 	  [H | T] = Deck,
 	  io:format("~p: ~p~n", [Id, H]),
 	  From ! {self(), Id, played, H},
 	  play({From, Id, T});
 	exit ->
 	  io:format("~p exits~n", [Id])
 end.

show_deck(Deck) ->
  lists:foreach(fun(Item) -> io:format("~p~n", [Item]) end, Deck).
