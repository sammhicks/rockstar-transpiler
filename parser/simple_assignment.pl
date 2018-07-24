
:- module(value, [
	      simple_assignment//1
	  ]).

:- use_module(library(dcg/basics), [
		  number//1
	      ]).

:- use_module(variables).
:- use_module(space).
:- use_module(string_value).


simple_assignment(Variable:=Value) -->
	put_keyword,
	spaces,
	value(Value),
	spaces,
	into,
	spaces,
	variable(Variable).

simple_assignment(++(Variable)) -->
	build,
	spaces,
	variable(Variable),
	spaces,
	up.

simple_assignment(--(Variable)) -->
	knock,
	spaces,
	variable(Variable),
	spaces,
	down.


put_keyword --> "put".
put_keyword --> "Put".


into --> "into".
into --> "Into".


build --> "build".
build --> "Build".


up --> "up".
up --> "Up".


knock --> "knock".
knock --> "Knock".


down --> "down".
down --> "Down".


value(mysterious) --> mysterious.
value(null) --> null.
value(true) --> true.
value(false) --> false.
value(number(Number)) --> number(Number).
value(string(String)) --> string_value(String).


mysterious --> "mysterious".


null --> "null".
null --> "nothing".
null --> "nowhere".
null --> "nobody".


true --> "true".


false --> "false".


