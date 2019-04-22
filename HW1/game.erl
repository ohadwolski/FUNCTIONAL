%%%-------------------------------------------------------------------
%%% @author guy ab
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. אפר׳ 2019 10:11
%%%-------------------------------------------------------------------
-module(game).
-author("guy ab").

%% API
-export([canWin/1,nextMove/1,explanation/0]).


canWin(1)->true;
canWin(2)->true;
canWin(3)->false;
canWin(N) when N>2 ->
  (not canWin(N-1)) or (not canWin(N-2)).

nextMove(1) ->{true,1};
nextMove(2) ->{true,2};
nextMove(3)-> {false};
nextMove(N) ->
  canIWin=canWin(N),
  canEnemyWin1 = canWin(N-1),
  canEnemyWin2 = canWin(N-2),
  if
    not canIWin -> false;
    not canEnemyWin1 -> {true,1};
    not canEnemyWin2 -> {true,2}
  end.

explanation() -> {""}.



