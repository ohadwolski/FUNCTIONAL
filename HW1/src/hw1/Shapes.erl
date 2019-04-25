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
-export([shapesArea/1,squaresArea/1,trianglesArea/1,shapesFilter/1,shapesFilter2/1]).

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
  squaresList = [x||{rectangle,x,x}<-M],
  calcSquaresArea(squaresList).


calcSquaresArea([]) -> 0;
calcSquaresArea([H|T]) when H>0 ->  H*H+calcSquaresArea(T).


%% this one still doesnt check that we got all shapes
trianglesArea({shapes,[M]}) ->
  isTriangle = fun({shape,{kind,x,y}}) -> shape=:=triangle end,
  trianglesList=lists:filter(isTriangle,M),
  calcTrianglesArea(trianglesList).


calcTrianglesArea([]) -> 0;
calcTrianglesArea([H|T]) when H>0 ->  singleShapeArea(H)+calcSquaresArea(T).


shapesFilter(kindOfShape) when kindOfShape==rectangle or
  kindOfShape==triangle or kindOfShape==ellipse ->
  %%For every shape case, we return a Fun that filters the relvant shape and gets a Shape struct that
  %% only contains these shapes
  case kindOfShape of
    rectangle ->
      findRectangles = fun({shapes,[M]}) ->
        isRectangle = fun({shape,{kind,x,y}}) -> shape=:=rectangle end,
        newList=lists:filter(isRectangle,M),
        {shapes,newList} end,
      findRectangles;
    trisngle ->
      findTriangles = fun({shapes,[M]}) ->
        isTriangle = fun({shape,{kind,x,y}}) -> shape=:=triangle end,
        newList=lists:filter(isTriangle,M),
        {shapes,newList} end,
      findTriangles;
    ellipse ->
      findElipses = fun({shapes,[M]}) ->
        isElipse = fun({shape,{kind,x,y}}) -> shape=:=elipse end,
        newList=lists:filter(isElipse,M),
        {shapes,newList} end,
      findElipses
  end.


shapesFilter2(kindOfShape)
  when kindOfShape==rectangle or
  kindOfShape==triangle or kindOfShape==ellipse ->
%%For every shape case, we return a Fun that filters the relvant shape and gets a Shape struct that
%% only contains these shapes
  case kindOfShape of
    rectangle ->
      findRectangles = fun({shapes,[M]}) ->
        isRectangle = fun({shape,{kind,x,y}}) -> shape=:=rectangle end,
        newList=lists:filter(isRectangle,M),
        {shapes,newList} end,
      findRectangles;
    trisngle ->
      findTriangles = fun({shapes,[M]}) ->
        isTriangle = fun({shape,{kind,x,y}}) -> shape=:=triangle end,
        newList=lists:filter(isTriangle,M),
        {shapes,newList} end,
      findTriangles;
    ellipse ->
      findElipses = fun({shapes,[M]}) ->
        isElipse = fun({shape,{kind,x,y}}) -> shape=:=elipse end,
        newList=lists:filter(isElipse,M),
        {shapes,newList} end,
      findElipses;
    circle ->
      findCircles = fun({shapes,[M]}) ->
        isCircle = fun({shape,{kind,x,y}}) -> shape=:=elipse and x=:=y end,
        newList=lists:filter(isCircle,M),
        {shapes,newList} end,
      findCircles;
    square  ->
      findSquares = fun({shapes,[M]}) ->
        isSquare = fun({shape,{kind,x,y}}) -> shape=:=rectangle and x=:=y end,
        newList=lists:filter(isSquare,M),
        {shapes,newList} end,
      findSquares
  end.