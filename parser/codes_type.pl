:- module(codes_type, [
	      codes_type//2
	  ]).

codes_type(String, Type, Codes, Rest) :-
	codes_type_inner(Codes, Rest, Type, String_Codes),
	string_codes(String, String_Codes).

codes_type_inner([Code|Codes], Rest, Type, [Code|String_Codes]) :-
	code_type(Code, Type),
	!,
	codes_type_inner(Codes, Rest, Type, String_Codes).

codes_type_inner(Rest, Rest, _, []).
