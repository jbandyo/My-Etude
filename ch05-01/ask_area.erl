%% @author Joydip Bandyopadhyay
%% @doc Function to prompt user about shape and dimension and return the area
%% @copyright JB Inc.
%% version 1.0

-module(ask_area).
-export([area/0]).

area() ->
	Answer = io:get_line("R)ectangle, T)riangle, or E)llipse >"),
	Shape = get_shape(Answer),
	case Shape of
		rectangle -> Dimensions = get_inputs("Enter width > ", "Enter height > ");
		triangle  -> Dimensions = get_inputs("Enter base > ", "Enter height > ");
		ellipse   -> Dimensions = get_inputs("Enter major axis > ", "Enter minor axis > ");
		unknown   -> Dimensions = {error, "Unknown shape " ++ [Answer]}
	end,
    find_area({Shape, element(1, Dimensions), element(2, Dimensions)}).

get_shape(Line) ->
	Char = hd(Line),
	case Char of
		$r -> rectangle;
		$R -> rectangle; 
		$t -> triangle;
		$T -> triangle;
		$e -> ellipse; 
		$E -> ellipse; 
		 _ -> unknown
	end.

get_inputs(Prompt1, Prompt2) ->
	Dimension1 = get_dimension(Prompt1), 
	Dimension2 = get_dimension(Prompt2), 
	{Dimension1, Dimension2}.

get_dimension(Prompt) ->
	Line = io:get_line(Prompt),
	{Num, _} = string:to_integer(Line),
	Num.

find_area({unknown, _, Msg}) -> io:format([Msg]);
find_area({_, error, _}) -> io:format("Error in first number");
find_area({_, _, error}) -> io:format("Error in second number");
find_area({Shape, Dim1, Dim2}) when Dim1 >= 0; Dim2 >= 0 -> geom:area({Shape, Dim1, Dim2});
find_area({_, Dim1, Dim2}) -> io:format("Both numbers must be greater than or equal to zero~n").
