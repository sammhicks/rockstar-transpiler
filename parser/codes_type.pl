:- module(codes_type, [
	      string_type//2,
	      codes_type//3,
	      code_type//2
	  ]).

string_type(String, Type, Codes, Rest) :-
	codes_type(String_Codes, [], Type, Codes, Rest),
	string_codes(String, String_Codes).


codes_type(Matched_Codes, Matched_Rest, Type, Codes, Rest) :-
	codes_type_inner(Codes, Rest, Type, Matched_Codes, Matched_Rest).


codes_type_inner([Code|Codes], Rest, Type, [Code|String_Codes], Matched_Rest) :-
	code_type(Code, Type),
	!,
	codes_type_inner(Codes, Rest, Type, String_Codes, Matched_Rest).

codes_type_inner(Rest, Rest, _, Matched_Rest, Matched_Rest).


code_type(Code, Type, [Code|Rest], Rest) :-
	code_type(Code, Type).
