
:- module(poetic_assignment, [
	      poetic_assignment//1
	  ]).


:- use_module(variables).
:- use_module(space).


poetic_assignment(Assignment) -->
	simple_assignment(Assignment).

poetic_assignment(Assignment) -->
	string_assignment(Assignment).

poetic_assignment(Assignment) -->
	number_assignment(Assignment).


simple_assignment(Variable:-Value) -->
	variable(Variable),
	spaces,
	is_keyword,
	spaces,
	simple_poetic_assignment_value(Value).


is_keyword -->
	"is".


simple_poetic_assignment_value(true) --> true.
simple_poetic_assignment_value(false) --> false.
simple_poetic_assignment_value(null) --> null.


true --> "true".


false --> "false".


null --> "nothing".
null --> "nowhere".
null --> "nobody".



string_assignment(Variable:-string(String)) -->
	variable(Variable),
	spaces,
	says_keyword,
	spaces,
	string_rest(String).


says_keyword -->
	"says".


string_rest(String, Codes, []) :-
	string_codes(String, Codes).


number_assignment(Variable:-number(Number)) -->
	variable(Variable),
	spaces,
	is_was_were_keyword,
	spaces,
	poetic_number(Number).


is_was_were_keyword --> "is".
is_was_were_keyword --> "was".
is_was_were_keyword --> "were".


poetic_number(Number, Codes, []) :-
	poetic_number_digits(Codes, Digit_Codes),
	string_codes(Number, Digit_Codes).


poetic_number_digits(Codes, Digits) :-
	poetic_number_digits(Codes, Digits, not_found).


poetic_number_digits([], [], _).

poetic_number_digits([Code|Codes], [Digit_Code|Digit_Codes], Decimal_Point_Found) :-
	code_type(Code, alpha),
	!,
	poetic_number_digit([Code|Codes], Rest, 0, Digit),
	digit_code(Digit, Digit_Code),
	poetic_number_digits(Rest, Digit_Codes, Decimal_Point_Found).


poetic_number_digits([Code|Codes], [Code|Digit_Codes], not_found) :-
	string_codes(".", [Code]),
	!,
	poetic_number_digits(Codes, Digit_Codes, found).


poetic_number_digits([_|Codes], Digits, Decimal_Point_Found) :-
	poetic_number_digits(Codes, Digits, Decimal_Point_Found).


poetic_number_digit([Code|Codes], Rest, Digit, Final_Digit) :-
	code_type(Code, alpha),
	!,
	New_Digit is Digit + 1,
	poetic_number_digit(Codes, Rest, New_Digit, Final_Digit).

poetic_number_digit(Rest, Rest, Digit, Digit).


digit_code(Digit, Digit_Code) :-
	string_codes("0", [Zero_Code]),
	Digit_Code is Zero_Code + (Digit mod 10).
