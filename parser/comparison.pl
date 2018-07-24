
:- module(comparison, [
	      comparison//1
	  ]).

:- use_module(library(dcg/basics), [
		  number//1
	      ]).

:- use_module(variables).
:- use_module(space).
:- use_module(string_value).

comparison((Variable, Comparison, Value)) -->
	variable(Variable),
	spaces,
	equality_keyword(Comparison),
	spaces,
	value(Value).

comparison((Variable, Comparison, Value)) -->
	variable(Variable),
	spaces,
	is_keyword,
	spaces,
	comparator_keyword(Comparison),
	spaces,
	than_keyword,
	spaces,
	value(Value).


equality_keyword(=/=) --> not_equals_keyword.
equality_keyword(=) --> equals_keyword.


not_equals_keyword --> "is", spaces, "not".
not_equals_keyword --> "ain't".


equals_keyword --> "is".


is_keyword --> "is".


than_keyword --> "than".


comparator_keyword(>) --> greater_keyword.
comparator_keyword(<) --> lesser_keyword.


greater_keyword --> "higher".
greater_keyword --> "greater".
greater_keyword --> "bigger".
greater_keyword --> "stronger".


lesser_keyword --> "lower".
lesser_keyword --> "less".
lesser_keyword --> "smaller".
lesser_keyword --> "weaker".


value(true) --> true.
value(false) --> false.
value(mysterious) --> mysterious.
value(null) --> null.
value(variable(Variable)) --> variable(Variable).
value(number(Number)) --> number(Number).
value(string(String)) --> string_value(String).


true --> "true".


false --> "false".


mysterious --> "mysterious".


null --> "null".
null --> "nothing".
null --> "nobody".
null --> "nowhere".
