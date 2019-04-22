%%%-------------------------------------------------------------------
%%% @author guy ab
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. אפר׳ 2019 09:33
%%%-------------------------------------------------------------------
-module('Shapes').
-author("guy ab").

%% API
-export([shapesArea/1,squaresArea/1]).

%%shapesArea - exported function that gets shapes lists and caculates their area sum
% if the list is empty, the total area is zero
shapesArea({shapes,[]}) ->0;
%if it's not, then calculate in tail recursion
shapesArea({shapes,[H|T]}) -> shapesArea({shapes,T}) + singleShapeArea(H).

% Helper Function that calculates the area of a single shape
singleShapeArea({rectangle,{dim,Width,Height}}) when Height>0 and Width>0 ->
  Height*Width;
singleShapeArea({triangle,{dim,Base,Height}}) when Height>0 and Base>0 ->
   Height*Base;

singleShapeArea({ellipse,{radius,Radius1,Radius2}}) when Radius1>0 and Radius2>0 ->
 Radius1*Radius2*math:pi.

%% this one still doesnt check that we got all shapes
squaresArea({shapes,[M]}) ->
  squaresOnly = [x||{rectangle,x,x}<-M],
  calcSquaresArea(squaresOnly).


calcSquaresArea([]) -> 0;
calcSquaresArea([H|T]) when H>0 ->  H*H+calcSquaresArea(T).


%% this one still doesnt check that we got all shapes
trianglesArea({shapes,[M]}) ->
  trianglesOnly = [{x,y}||{triangle,x,y}<-M],
  calcTrianglesArea(trianglesOnly).


calcTrianglesArea([]) -> 0;
calcSquaresArea([H|T]) when H>0 ->  H*H+calcSquaresArea(T).



