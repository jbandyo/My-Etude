%% @author Joydip Bandyopadhyay
%% @doc This module creates a deck of cards.
%% @copyright JB Inc.
%% version 1.0

-module(cards).
-export([make_deck/0, show_deck/1]).

make_deck() -> 
  Suits = ["Clubs", "Diamonds", "Hearts", "Spades"],
  Ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"],
  Deck = [{X, Y} || X <- Ranks, Y <- Suits],
  show_deck(Deck).
  
show_deck(Deck) ->
  lists:foreach(fun(Item) -> io:format("~p~n", [Item]) end, Deck).