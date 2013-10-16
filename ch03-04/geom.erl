%% @author Joydip Bandyopadhyay
%% @doc Function to calculate area of different shapes
%% @copyright JB Inc.
%% version 1.0

-module(geom).
-export([area/1]).

%% @doc Area calculates area of rectangle, triangle and ellipse

area(Shape) -> area(element(1,Shape), element(2,Shape), element(3,Shape)).

area(rectangle, A, B) when A >= 0, B >= 0 -> A * B;

area(triangle, A, B)  when A >= 0, B >= 0 -> (A * B) / 2;

area(ellipse, A, B)   when A >= 0, B >= 0 -> math:pi() * A * B;

area(_, _, _) -> 0.