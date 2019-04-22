-module(world).
-export([hello/0]).

% Say hello to world
hello() -> io:format("Hello world!~n").
