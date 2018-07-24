
:- module(variables, [
	      variable//1
	  ]).

:- use_module(codes_type).


variable(Name) -->
	common_variable(Name),
	!.

variable(Name) -->
	proper_variable(Name),
	!.

variable(pronoun) -->
	pronoun.


common_variable(Name) -->
	common_variable_prefix,
	" ",
	!,
	string_type(Name, lower).


common_variable_prefix --> "the".
common_variable_prefix --> "The".
common_variable_prefix --> "my".
common_variable_prefix --> "My".
common_variable_prefix --> "your".
common_variable_prefix --> "Your".


proper_variable(Name, Codes, Rest) :-
	proper_variable_codes(Name_Codes, Codes, Rest),
	string_codes(Name, Name_Codes).


proper_variable_codes(Name) -->
	proper_variable_word(Name, Name_Tail),
	proper_variable_tail(Name_Tail).


proper_variable_tail(Words) -->
	proper_variable_tail(Words, []).


proper_variable_tail(Words, Rest) -->
	proper_variable_tail_word(Words, Tail),
	!,
	proper_variable_tail(Tail, Rest).

proper_variable_tail(Rest, Rest) -->
	[].


proper_variable_tail_word([Space|Letters], Rest) -->
	" ",
	proper_variable_word(Letters, Rest),
	{
	    string_codes(" ", [Space])
	}.


proper_variable_word([Letter|Letters], Rest) -->
	code_type(Letter, upper),
	codes_type(Letters, Rest, lower).


pronoun -->
	"it".

pronoun -->
	"he".

pronoun -->
	"she".

pronoun -->
	"him".

pronoun -->
	"her".

pronoun -->
	"them".

pronoun -->
	"they".
