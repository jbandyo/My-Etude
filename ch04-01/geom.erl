%% @author Joydip Bandyopadhyay
%% @doc Function to calculate area of different shapes
%% @copyright JB Inc.
%% version 1.0

-module(geom).
-export([area/3]).

%% @doc Calculates area of rectangle, triangle and ellipse. Uses guards to make sure that 
%% the dimensions are not negetive. Uses case instead of pattern matching.

-spec(area(atom(), number(), number()) -> number()).

area(Shape, A, B) when A >= 0, B >= 0 ->
  case Shape of
    rectangle -> A * B;
    triangle  -> (A * B) / 2;
    ellipse   -> math:pi() * A * B
  end.
  