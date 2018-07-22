
:- module(variables, [
	      common_variable//1
	  ]).

:- use_module(codes_type).

common_variable(Name) -->
	common_variable_prefix,
	" ",
	!,
	codes_type(Name, lower).


common_variable_prefix -->
	"the".

common_variable_prefix -->
	"my".

common_variable_prefix -->
	"your".

