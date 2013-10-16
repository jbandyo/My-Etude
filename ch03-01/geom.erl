%% @author Joydip Bandyopadhyay
%% @doc Function to calculate area of different shapes
%% @copyright JB Inc.
%% version 1.0

-module(geom).
-export([area/3]).

%% @doc Area calculates area of rectangle, triangle and ellipse

-spec(area(shape, number(), number()) -> number()).

area(rectangle, A, B) -> A * B;

area(triangle, A, B) -> (A * B) / 2;

area(ellipse, A, B) -> math:pi() * A * B.