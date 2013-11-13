%% @author Joydip Bandyopadhyay
%% @doc
%% @copyright JB Inc.
%% version 1.0

-module(cards).
-export([make_deck/0, show_deck/1]).

make_deck() -> 
  Suits = ["Clubs", "Diamonds", "Hearts", "Spades"],
  Ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"],
  Deck = [{X, Y} || X <- Ranks, Y <- Suits],
  Shuffled = shuffle(Deck).
  
show_deck(Deck) ->
  lists:foreach(fun(Item) -> io:format("~p~n", [Item]) end, Deck).

shuffle(List) -> shuffle(List, []).
    
shuffle([], Acc) -> Acc;
    
shuffle(List, Acc) ->
  %% split the cards in two parts at a random place, part1 and part2
  %% take the top one from part2 and move to top of shuffled deck
  %% put part1 and rest of part 2 together
  {Leading, [H | T]} = lists:split(random:uniform(length(List)) - 1, List), 
  shuffle(Leading ++ T, [H | Acc]).