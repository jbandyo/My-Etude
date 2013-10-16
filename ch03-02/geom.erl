%% @author Joydip Bandyopadhyay
%% @doc Function to calculate area of different shapes
%% @copyright JB Inc.
%% version 1.0

-module(geom).
-export([area/3]).

%% @doc Area calculates area of rectangle, triangle and ellipse

-spec(area(shape, number(), number()) -> number()).

area(rectangle, A, B) when A >= 0, B >= 0 -> A * B;

area(triangle, A, B)  when A >= 0, B >= 0 -> (A * B) / 2;

area(ellipse, A, B)   when A >= 0, B >= 0 -> math:pi() * A * B.