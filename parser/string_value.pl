
:- module(string_value, [
	      string_value//1
	  ]).

:- use_module(library(dcg/basics), [
		  string_without//2
	      ]).


string_value(single(String)) --> single_string(String).
string_value(double(String)) --> double_string(String).


single_string(String, Codes, Rest) :-
	single_string_codes(String_Codes, Codes, Rest),
	string_codes(String, String_Codes).


single_string_codes(String_Codes) -->
	"'",
	string_without("'", String_Codes),
	"'".


double_string(String, Codes, Rest) :-
	double_string_codes(String_Codes, Codes, Rest),
	string_codes(String, String_Codes).


double_string_codes(String_Codes) -->
	"\"",
	string_without("\"", String_Codes),
	"\"".
