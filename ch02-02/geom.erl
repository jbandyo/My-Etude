%% @author Joydip Bandyopadhyay
%% @doc Function to calculate area from width and height
%% @copyright JB Inc.
%% version 1.0

-module(geom).
-export([area/2]).

%% @doc Area calculates area from width and height

-spec(area(number(), number()) -> number()).

area(Width, Height) -> Width * Height.