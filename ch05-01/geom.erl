%% @author Joydip Bandyopadhyay
%% @doc Function to calculate area of different shapes
%% @copyright JB Inc.
%% version 1.0

-module(geom).
-export([area/1]).

%% @doc Calculates area of rectangle, triangle and ellipse. Takes a tuple as input, delegates to 
%% internal area/3 function.

-spec(area({atom(), number(), number()}) -> number()).

area(Shape) -> area(element(1,Shape), element(2,Shape), element(3,Shape)).

%% @doc Calculates area of rectangle, triangle and ellipse. Uses guards to make sure that 
%% the dimensions are not negetive. Returns zeroes on invalid inputs.

-spec(area(atom(), number(), number()) -> number()).

area(rectangle, A, B) when A >= 0, B >= 0 -> A * B;

area(triangle, A, B)  when A >= 0, B >= 0 -> (A * B) / 2;

area(ellipse, A, B)   when A >= 0, B >= 0 -> math:pi() * A * B;

area(_, _, _) -> 0.