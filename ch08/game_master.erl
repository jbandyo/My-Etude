%% @author Joydip Bandyopadhyay
%% @doc
%% @copyright JB Inc.
%% version 1.0

-module(game_master).
-export([game/0]).

game() ->
  receive
  	deal ->
  	  Deck = make_deck(),
  	  {DeckA, DeckB} = lists:split(26, Deck),
  	  io:format("Player A dealt~n"),
  	  PlayerA = spawn(player, play, [{self(), "PlayerA", DeckA}]),
  	  io:format("Player B dealt~n"),
  	  PlayerB = spawn(player, play, [{self(), "PlayerB", DeckB}]),
      PlayerA ! yourTurn,
      game_loop(PlayerA, PlayerB, playerA2Go, 26, 26)
  end.

game_loop(PlayerA, PlayerB, Player2Go, CountA, CountB) ->
  receive
  	{From, Id, played, Trick} ->
  	  case Player2Go of
  	  	playerA2Go ->
          PlayerB ! yourTurn,
          game_loop(PlayerA, PlayerB, playerB2Go, CountA-1, CountB);
  	  	playerB2Go ->
          if 
          	((CountA == 0) or (CountB-1 == 0)) ->
              PlayerA ! exit,
              PlayerB ! exit,
              io:format("Game over!~n");
           	true -> 
           	  PlayerA ! yourTurn,
			  game_loop(PlayerA, PlayerB, playerA2Go, CountA, CountB-1)
          end
      end
  end.

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
  {Leading, [H | T]} = lists:split(random:uniform(length(List)) - 1, List), 
  shuffle(Leading ++ T, [H | Acc]).